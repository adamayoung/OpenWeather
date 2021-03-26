import Combine
import Foundation

protocol Client {

    func request<Response: Decodable>(_ endpoint: Endpoint, apiKey: String) -> AnyPublisher<Response, OpenWeatherError>

}

final class HTTPClient: Client {

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    public init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .openWeather) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    public func request<Response: Decodable>(_ endpoint: Endpoint,
                                             apiKey: String) -> AnyPublisher<Response, OpenWeatherError> {
        let url = endpoint.url
            .appendingQueryItem(name: "appid", value: apiKey)

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        return urlSession.dataTaskPublisher(for: urlRequest)
            .mapOpenWeatherError()
            .mapResponse(to: Response.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }

}

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
