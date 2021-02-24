import Foundation

struct WindMeasurement: Decodable {

    let speed: Double
    let direction: Double
    let gust: Double?

}

extension WindMeasurement {

    private enum CodingKeys: String, CodingKey {
        case speed
        case direction = "deg"
        case gust
    }

}
