import Foundation

extension Place {
    
    init(dto: WeatherDTO) {
        let coordinate = Coordinate(dto: dto.coordinate)
        
        self.init(id: dto.id, name: dto.name, countryCode: dto.meta.country, coordinate: coordinate)
    }

}
