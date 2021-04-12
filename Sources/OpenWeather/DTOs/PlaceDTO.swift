import Foundation

struct PlaceDTO: Decodable {

    let id: Int
    let name: String
    let country: String
    let coordinate: CoordinateDTO

}

extension PlaceDTO {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case coordinate = "coord"
    }

}
