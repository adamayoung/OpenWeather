import Foundation

struct CloudMeasurementDTO: Decodable {

    let cloudiness: Double

}

extension CloudMeasurementDTO {

    private enum CodingKeys: String, CodingKey {
        case cloudiness = "all"
    }

}
