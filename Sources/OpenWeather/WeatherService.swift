import Combine
import Foundation

/// A Weather service.
public protocol WeatherService {

    /// Fetch weather for a city or town by location name.
    ///
    /// - Parameters:
    ///   - cityName: Name of city or name to fetch weather for.
    ///
    /// - Returns: A publisher containing the weather.
    func weatherPublisher(forCity cityName: String) -> AnyPublisher<WeatherDTO, OpenWeatherError>
    
    /// Fetch weather for a city or town by ID.
    ///
    /// - Parameters:
    ///   - cityID: Identifier of city to fetch weather for.
    ///
    /// - Returns: A publisher containing the weather.
    func weatherPublisher(forCityID cityID: Int) -> AnyPublisher<WeatherDTO, OpenWeatherError>
    
    /// Fetch weather for a city or town by geographic coordinates.
    ///
    /// - Parameters:
    ///   - latitude: Latitude.
    ///   - longitude: Longitude.
    ///
    /// - Returns: A publisher containing the weather.
    func weatherPublisher(forLatitude latitude: Double, longitude: Double) -> AnyPublisher<WeatherDTO, OpenWeatherError>
    
    /// Search for places.
    ///
    /// - Parameters:
    ///   - query: The place to search for.
    ///
    /// - Returns: A publisher containing the matching places.
    func placesPublisher(query: String) -> AnyPublisher<[PlaceDTO], Never>
    
    /// Place at geographic coordinates.
    ///
    /// - Parameters:
    ///   - latitude: Latitude.
    ///   - longitude: Longitude.
    ///
    /// - Returns: A publisher containing the place.
    func placePublisher(atLatitude latitude: Double, longitude: Double) -> AnyPublisher<PlaceDTO, OpenWeatherError>

}

/// Open Weather Service.
public final class OpenWeatherService: WeatherService {

    private let apiKey: String
    private let client: Client
    private lazy var places: [Place]? = {
        guard let url = Bundle.module.url(forResource: "Data/city.list", withExtension: "json") else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }

        return try? JSONDecoder().decode([Place].self, from: data)
    }()

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

    public func weatherPublisher(forCity cityName: String) -> AnyPublisher<WeatherDTO, OpenWeatherError> {
        client.request(OpenWeatherEndpoint.weatherByCityName(cityName: cityName), apiKey: apiKey)
            .map(WeatherDTO.init)
            .eraseToAnyPublisher()
    }
    
    public func weatherPublisher(forCityID cityID: Int) -> AnyPublisher<WeatherDTO, OpenWeatherError> {
        client.request(OpenWeatherEndpoint.weatherByCityID(cityID: cityID), apiKey: apiKey)
            .map(WeatherDTO.init)
            .eraseToAnyPublisher()
    }
    
    public func weatherPublisher(forLatitude latitude: Double,
                                 longitude: Double) -> AnyPublisher<WeatherDTO, OpenWeatherError> {
        client.request(OpenWeatherEndpoint.weatherByLocation(latitude: latitude, longitude: longitude), apiKey: apiKey)
            .map(WeatherDTO.init)
            .eraseToAnyPublisher()
    }
    
    public func placesPublisher(query: String) -> AnyPublisher<[PlaceDTO], Never> {
        return Just([Place]())
            .receive(on: DispatchQueue.global(qos: .userInitiated))
            .map { _ in self.places }
            .replaceNil(with: [])
            .map { places in
                places.filter { $0.name.lowercased().starts(with: query.lowercased()) }
            }
            .map(PlaceDTO.create)
            .eraseToAnyPublisher()
    }
    
    public func placePublisher(atLatitude latitude: Double,
                               longitude: Double) -> AnyPublisher<PlaceDTO, OpenWeatherError> {
        weatherPublisher(forLatitude: latitude, longitude: longitude)
            .map(\.place)
            .eraseToAnyPublisher()
    }

}
