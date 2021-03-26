import Foundation

struct Place: Decodable {
    
    let id: Int
    let name: String
    let country: String
    let coordinate: Coordinate
    
}

extension Place {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case coordinate = "coord"
    }
    
}
