import Foundation

#if canImport(Combine)
import Combine
#endif

protocol Client {

    @available(OSX 10.15, iOS 14, watchOS 7, *)
    func request<Response: Decodable>(_ endpoint: Endpoint, apiKey: String) -> AnyPublisher<Response, OpenWeatherError>

    func request<Response: Decodable>(_ endpoint: Endpoint, apiKey: String, completion: @escaping (Result<Response, OpenWeatherError>) -> Void)

}

final class HTTPClient: Client {

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    public init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .openWeather) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    @available(OSX 10.15, iOS 14, watchOS 7, *)
    func request<Response: Decodable>(_ endpoint: Endpoint,
                                      apiKey: String) -> AnyPublisher<Response, OpenWeatherError> {
        let urlRequest = Self.createURLRequest(for: endpoint, apiKey: apiKey)

        return urlSession.dataTaskPublisher(for: urlRequest)
            .mapOpenWeatherError()
            .mapResponse(to: Response.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }

    func request<Response: Decodable>(_ endpoint: Endpoint, apiKey: String, completion: @escaping (Result<Response, OpenWeatherError>) -> Void) {
        let urlRequest = Self.createURLRequest(for: endpoint, apiKey: apiKey)

        urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else {
                return
            }

            if let error = error as? URLError {
                completion(.failure(.network(error)))
                return
            }

            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            if statusCode != 200 {
                let error: OpenWeatherError = {
                    switch statusCode {
                    case 401:
                        return .unauthorized

                    case 404:
                        return .notFound

                    default:
                        return .unknown
                    }
                }()

                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(.unknown))
                return
            }

            do {
                let result = try self.jsonDecoder.decode(Response.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(.decode(error)))
                return
            }
        }
    }

    private static func createURLRequest(for endpoint: Endpoint, apiKey: String) -> URLRequest {
        let url = endpoint.url
            .appendingQueryItem(name: "appid", value: apiKey)

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        return urlRequest
    }

}

@available(OSX 10.15, iOS 14, watchOS 7, *)
extension URLSession.DataTaskPublisher {

    func mapOpenWeatherError() -> AnyPublisher<Output, OpenWeatherError> {
        self
            .mapError { .network($0) }
            .flatMap { (data, response) -> AnyPublisher<Output, OpenWeatherError> in
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                guard statusCode != 200 else {
                    return Just((data, response))
                        .setFailureType(to: OpenWeatherError.self)
                        .eraseToAnyPublisher()
                }

                let error: OpenWeatherError = {
                    switch statusCode {
                    case 401:
                        return .unauthorized

                    case 404:
                        return .notFound

                    default:
                        return .unknown
                    }
                }()

                return Fail(outputType: Output.self, failure: error)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

}

@available(OSX 10.15, iOS 14, watchOS 7, *)
extension Publisher where Output == URLSession.DataTaskPublisher.Output {

    func mapResponse<Output: Decodable>(to outputType: Output.Type,
                                        decoder: JSONDecoder) -> AnyPublisher<Output, OpenWeatherError> {
        self
            .map { $0.data }
            .decode(type: outputType, decoder: decoder)
            .mapError {
                .decode($0)
            }
            .eraseToAnyPublisher()
    }

}
