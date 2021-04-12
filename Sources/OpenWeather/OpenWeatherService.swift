import Foundation

#if canImport(Combine)
import Combine
#endif

/// Open Weather Service.
public final class OpenWeatherService: WeatherService {

    /// Shared instance of the Open Weather Service.
    public static let shared = OpenWeatherService()

    private var apiKey: String = ""
    private let client: Client
    private lazy var places: [PlaceDTO] = {
        guard let url = Bundle.module.url(forResource: "Data/city.list", withExtension: "json") else {
            return []
        }

        guard let data = try? Data(contentsOf: url) else {
            return []
        }

        return (try? JSONDecoder().decode([PlaceDTO].self, from: data)) ?? []
    }()

    init(client: Client = HTTPClient()) {
        self.client = client
    }

    /// Sets the Open Weather API Key.
    ///
    /// - Parameters:
    ///   - apiKey: The API Key.
    public static func setAPIKey(_ apiKey: String) {
        shared.apiKey = apiKey
    }

}

#if !os(Linux)
@available(OSX 10.15, iOS 14, watchOS 7, *)
extension OpenWeatherService {

    public func weatherPublisher(forCity cityName: String) -> AnyPublisher<Weather, OpenWeatherError> {
        client.request(OpenWeatherEndpoint.weatherByCityName(cityName: cityName), apiKey: apiKey)
            .map(Weather.init)
            .eraseToAnyPublisher()
    }

    public func weatherPublisher(forCityID cityID: Int) -> AnyPublisher<Weather, OpenWeatherError> {
        client.request(OpenWeatherEndpoint.weatherByCityID(cityID: cityID), apiKey: apiKey)
            .map(Weather.init)
            .eraseToAnyPublisher()
    }

    public func weatherPublisher(forLatitude latitude: Double,
                                 longitude: Double) -> AnyPublisher<Weather, OpenWeatherError> {
        client.request(OpenWeatherEndpoint.weatherByLocation(latitude: latitude, longitude: longitude), apiKey: apiKey)
            .map(Weather.init)
            .eraseToAnyPublisher()
    }

    public func placesPublisher(query: String) -> AnyPublisher<[Place], Never> {
        return Just([Place]())
            .receive(on: DispatchQueue.global(qos: .userInitiated))
            .map { _ in self.places }
            .map { $0.filter(Self.placesFilter(query: query)) }
            .map(Place.collection)
            .eraseToAnyPublisher()
    }

    public func placePublisher(atLatitude latitude: Double,
                               longitude: Double) -> AnyPublisher<Place, OpenWeatherError> {
        weatherPublisher(forLatitude: latitude, longitude: longitude)
            .map(\.place)
            .eraseToAnyPublisher()
    }

}

extension OpenWeatherService {

    public func fetchWeather(forCity cityName: String,
                             completion: @escaping (Result<Weather, OpenWeatherError>) -> Void) {
        client.request(OpenWeatherEndpoint.weatherByCityName(cityName: cityName),
                       apiKey: apiKey) { (result: Result<WeatherDTO, OpenWeatherError>) in
            completion(result.map(Weather.init))
        }
    }

    public func fetchWeather(forCityID cityID: Int,
                             completion: @escaping (Result<Weather, OpenWeatherError>) -> Void) {
        client.request(OpenWeatherEndpoint.weatherByCityID(cityID: cityID),
                       apiKey: apiKey) { (result: Result<WeatherDTO, OpenWeatherError>) in
            completion(result.map(Weather.init))
        }
    }

    public func fetchWeather(forLatitude latitude: Double, longitude: Double,
                             completion: @escaping (Result<Weather, OpenWeatherError>) -> Void) {
        client.request(OpenWeatherEndpoint.weatherByLocation(latitude: latitude, longitude: longitude),
                       apiKey: apiKey) { (result: Result<WeatherDTO, OpenWeatherError>) in
            completion(result.map(Weather.init))
        }
    }

    public func searchPlaces(query: String, completion: @escaping (Result<[Place], Never>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else {
                return
            }

            let matchingPlaces = self.places
                .filter(Self.placesFilter(query: query))
            let dto = Place.collection(dtos: matchingPlaces)

            completion(.success(dto))
        }
    }

    public func fetchPlace(atLatitude latitude: Double, longitude: Double,
                           completion: @escaping (Result<Place, OpenWeatherError>) -> Void) {
        fetchWeather(forLatitude: latitude, longitude: longitude) { result in
            completion(result.map(\.place))
        }
    }

}
#endif

extension OpenWeatherService {

    private static func placesFilter(query: String) -> (PlaceDTO) -> Bool {
        {
            $0.name.lowercased().starts(with: query.lowercased())
        }
    }

}
