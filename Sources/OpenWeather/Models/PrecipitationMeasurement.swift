import Foundation

struct PrecipitationMeasurement: Decodable {

    let inLastHour: Double
    let inLastThreeHours: Double?

}

extension PrecipitationMeasurement {

    private enum CodingKeys: String, CodingKey {
        case inLastHour = "1h"
        case inLastThreeHours = "3h"
    }

}
