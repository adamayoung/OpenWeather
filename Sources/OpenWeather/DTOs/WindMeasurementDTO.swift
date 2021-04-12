import Foundation

struct WindMeasurementDTO: Decodable {

    let speed: Double
    let direction: Double
    let gust: Double?

}

extension WindMeasurementDTO {

    private enum CodingKeys: String, CodingKey {
        case speed
        case direction = "deg"
        case gust
    }

}
