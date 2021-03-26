import Foundation

extension PlaceDTO {
    
    init(place: Place) {
        let coordinate = CoordinateDTO(coordinate: place.coordinate)
        
        self.init(id: place.id, name: place.name, countryCode: place.country, coordinate: coordinate)
    }
    
    static func create(places: [Place]) -> [PlaceDTO] {
        places.map(PlaceDTO.init)
    }
    
}
