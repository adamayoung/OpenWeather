import Foundation

extension Place {
    
    init(dto: PlaceDTO) {
        let coordinate = Coordinate(dto: dto.coordinate)
        
        self.init(id: dto.id, name: dto.name, countryCode: dto.country, coordinate: coordinate)
    }
    
    static func collection(dtos: [PlaceDTO]) -> [Place] {
        dtos.map(Place.init)
    }
    
}
