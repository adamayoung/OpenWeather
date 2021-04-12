import Foundation

#if canImport(Combine)
    import Combine
#endif

/// A Weather service.
public protocol WeatherService {

    #if !os(Linux)
    /// Fetch weather for a city or town by location name.
    ///
    /// - Parameters:
    ///   - cityName: Name of city or name to fetch weather for.
    ///
    /// - Returns: A publisher containing the weather.
    @available(OSX 10.15, iOS 14, watchOS 7, *)
    func weatherPublisher(forCity cityName: String) -> AnyPublisher<Weather, OpenWeatherError>

    /// Fetch weather for a city or town by ID.
    ///
    /// - Parameters:
    ///   - cityID: Identifier of city to fetch weather for.
    ///
    /// - Returns: A publisher containing the weather.
    @available(OSX 10.15, iOS 14, watchOS 7, *)
    func weatherPublisher(forCityID cityID: Int) -> AnyPublisher<Weather, OpenWeatherError>

    /// Fetch weather for a city or town by geographic coordinates.
    ///
    /// - Parameters:
    ///   - latitude: Latitude.
    ///   - longitude: Longitude.
    ///
    /// - Returns: A publisher containing the weather.
    @available(OSX 10.15, iOS 14, watchOS 7, *)
    func weatherPublisher(forLatitude latitude: Double, longitude: Double) -> AnyPublisher<Weather, OpenWeatherError>

    /// Search for places.
    ///
    /// - Parameters:
    ///   - query: The place to search for.
    ///
    /// - Returns: A publisher containing the matching places.
    @available(OSX 10.15, iOS 14, watchOS 7, *)
    func placesPublisher(query: String) -> AnyPublisher<[Place], Never>

    /// Place at geographic coordinates.
    ///
    /// - Parameters:
    ///   - latitude: Latitude.
    ///   - longitude: Longitude.
    ///
    /// - Returns: A publisher containing the place.
    @available(OSX 10.15, iOS 14, watchOS 7, *)
    func placePublisher(atLatitude latitude: Double, longitude: Double) -> AnyPublisher<Place, OpenWeatherError>

    #endif

    /// Fetch weather for a city or town by location name.
    ///
    /// - Parameters:
    ///   - cityName: Name of city or name to fetch weather for.
    ///   - completion: Completion handler.
    func fetchWeather(forCity cityName: String, completion: @escaping (Result<Weather, OpenWeatherError>) -> Void)

    /// Fetch weather for a city or town by ID.
    ///
    /// - Parameters:
    ///   - cityID: Identifier of city to fetch weather for.
    ///   - completion: Completion handler.
    func fetchWeather(forCityID cityID: Int, completion: @escaping (Result<Weather, OpenWeatherError>) -> Void)

    /// Fetch weather for a city or town by geographic coordinates.
    ///
    /// - Parameters:
    ///   - latitude: Latitude.
    ///   - longitude: Longitude.
    ///   - completion: Completion handler.
    func fetchWeather(forLatitude latitude: Double, longitude: Double,
                      completion: @escaping (Result<Weather, OpenWeatherError>) -> Void)

    /// Search for places.
    ///
    /// - Parameters:
    ///   - query: The place to search for.
    ///   - completion: Completion handler.
    func searchPlaces(query: String, completion: @escaping (Result<[Place], Never>) -> Void)

    /// Place at geographic coordinates.
    ///
    /// - Parameters:
    ///   - latitude: Latitude.
    ///   - longitude: Longitude.
    ///   - completion: Completion handler.
    func fetchPlace(atLatitude latitude: Double, longitude: Double,
                    completion: @escaping (Result<Place, OpenWeatherError>) -> Void)

}
