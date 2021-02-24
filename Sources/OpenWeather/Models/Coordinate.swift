import Foundation

struct Coordinate: Decodable {

    let longitude: Double
    let latitude: Double

}

extension Coordinate {

    private enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }

}
