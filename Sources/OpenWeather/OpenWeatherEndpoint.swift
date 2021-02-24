import Foundation

enum OpenWeatherEndpoint {

    case weather(cityName: String)

}

extension OpenWeatherEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .weather(let cityName):
            return URL(string: "/weather")!
                .appendingQueryItem(name: "q", value: cityName)
        }
    }

}
