/// A Weather service.
public protocol WeatherService {

    /// Fetch weather for a city or town.
    ///
    /// - Parameters:
    ///   - cityName: Name of city or name to fetch weather for.
    ///   - completion: Completion handler.
    func fetchWeather(forCity cityName: String, completion: @escaping (Result<WeatherDTO, OpenWeatherError>) -> Void)

}

public final class OpenWeatherService: WeatherService {

    private let apiKey: String
    private let client: Client

    /// Creates a `OpenWeatherService`.
    ///
    /// - Parameter apiKey: An OpenWeather API key.
    public convenience init(apiKey: String) {
        self.init(apiKey: apiKey, client: HTTPClient())
    }

    init(apiKey: String, client: Client) {
        self.apiKey = apiKey
        self.client = client
    }

    public func fetchWeather(forCity cityName: String,
                             completion: @escaping (Result<WeatherDTO, OpenWeatherError>) -> Void) {
        client.request(OpenWeatherEndpoint.weather(cityName: cityName),
                       apiKey: apiKey) { (result: Result<Weather, OpenWeatherError>) in
            completion(result.map(WeatherDTO.init))
        }
    }

}
