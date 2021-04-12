import Foundation

enum OpenWeatherEndpoint {

    static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5")!

    case weatherByCityName(cityName: String)
    case weatherByCityID(cityID: Int)
    case weatherByLocation(latitude: Double, longitude: Double)

}

extension OpenWeatherEndpoint: Endpoint {

    var url: URL {
        switch self {
        case .weatherByCityName(let cityName):
            return Self.baseURL
                .appendingPathComponent("weather")
                .appendingQueryItem(name: "q", value: cityName)

        case .weatherByCityID(let cityID):
            return Self.baseURL
                .appendingPathComponent("weather")
                .appendingQueryItem(name: "id", value: cityID)

        case .weatherByLocation(let latitude, let longitude):
            return Self.baseURL
                .appendingPathComponent("weather")
                .appendingQueryItem(name: "lat", value: latitude)
                .appendingQueryItem(name: "lon", value: longitude)
        }
    }

}
