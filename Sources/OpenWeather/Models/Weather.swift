import Foundation

struct Weather: Identifiable, Decodable {

    let id: Int
    let name: String
    let timezone: Int
    let coordinate: Coordinate
    let conditions: [Condition]
    let measurement: WeatherMeasurement
    let visibility: Double
    let wind: WindMeasurement
    let cloud: CloudMeasurement
    let rainfall: PrecipitationMeasurement?
    let snowfall: PrecipitationMeasurement?
    let timestamp: Date
    let meta: WeatherMetadata
}

extension Weather {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case timezone
        case coordinate = "coord"
        case conditions = "weather"
        case measurement = "main"
        case visibility
        case wind
        case cloud = "clouds"
        case rainfall = "rain"
        case snowfall = "snow"
        case timestamp = "dt"
        case meta = "sys"
    }

}
