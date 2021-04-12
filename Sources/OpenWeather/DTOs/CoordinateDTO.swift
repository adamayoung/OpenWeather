import Foundation

struct CoordinateDTO: Decodable {

    let longitude: Double
    let latitude: Double

}

extension CoordinateDTO {

    private enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }

}
