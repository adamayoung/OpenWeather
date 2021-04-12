import Foundation

struct WeatherDTO: Identifiable, Decodable {

    let id: Int
    let name: String
    let timezone: Int
    let coordinate: CoordinateDTO
    let conditions: [ConditionDTO]
    let measurement: WeatherMeasurementDTO
    let visibility: Double
    let wind: WindMeasurementDTO
    let cloud: CloudMeasurementDTO
    let rainfall: PrecipitationMeasurementDTO?
    let snowfall: PrecipitationMeasurementDTO?
    let timestamp: Date
    let meta: WeatherMetadataDTO
}

extension WeatherDTO {

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
