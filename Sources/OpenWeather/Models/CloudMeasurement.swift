import Foundation

struct CloudMeasurement: Decodable {

    let cloudiness: Double

}

extension CloudMeasurement {

    private enum CodingKeys: String, CodingKey {
        case cloudiness = "all"
    }

}
