import Foundation

struct PrecipitationMeasurementDTO: Decodable {

    let inLastHour: Double
    let inLastThreeHours: Double?

}

extension PrecipitationMeasurementDTO {

    private enum CodingKeys: String, CodingKey {
        case inLastHour = "1h"
        case inLastThreeHours = "3h"
    }

}
