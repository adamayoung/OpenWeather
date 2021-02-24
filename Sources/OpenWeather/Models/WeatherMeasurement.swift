import Foundation

struct WeatherMeasurement: Decodable {

    let temperature: Double
    let feelsLikeTemperature: Double
    let maximumTemperature: Double
    let minimumTemperature: Double
    let pressure: Double
    let seaLevelPressure: Double?
    let groundLevelPressure: Double?
    let humidity: Double

}

extension WeatherMeasurement {

    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLikeTemperature = "feelsLike"
        case maximumTemperature = "tempMax"
        case minimumTemperature = "tempMin"
        case pressure
        case seaLevelPressure = "seaLevel"
        case groundLevelPressure = "grndLevel"
        case humidity
    }

}
