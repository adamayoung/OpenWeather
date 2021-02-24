import Foundation

protocol Client {

    func request<Response: Decodable>(_ endpoint: Endpoint, apiKey: String,
                                      completion: @escaping (Result<Response, OpenWeatherError>) -> Void)

}

final class HTTPClient: Client {

    private static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5")!

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    public init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .openWeather) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    public func request<Response: Decodable>(_ endpoint: Endpoint, apiKey: String,
                                             completion: @escaping (Result<Response, OpenWeatherError>) -> Void) {
        let url = Self.urlFromPath(endpoint.path)
            .appendingQueryItem(name: "appid", value: apiKey)
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else {
                return
            }

            if let error = error {
                let openWeatherError = OpenWeatherError(message: error.localizedDescription)
                completion(.failure(openWeatherError))
                return
            }

            guard let data = data else {
                let openWeatherError = OpenWeatherError(message: "No data received")
                completion(.failure(openWeatherError))
                return
            }

            do {
                let response = try self.jsonDecoder.decode(Response.self, from: data)
                completion(.success(response))
            } catch let error {
                let openWeatherError = OpenWeatherError(message: error.localizedDescription)
                completion(.failure(openWeatherError))
                return
            }
        }.resume()
    }

}

extension HTTPClient {

    private static func urlFromPath(_ path: URL) -> URL {
        guard var urlComponents = URLComponents(url: path, resolvingAgainstBaseURL: true) else {
            return path
        }

        let baseURL = Self.baseURL
        urlComponents.scheme = baseURL.scheme
        urlComponents.host = baseURL.host
        urlComponents.path = baseURL.path + "\(urlComponents.path)"
        urlComponents.query = path.query

        return urlComponents.url!
    }

}
