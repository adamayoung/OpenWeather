import Foundation

extension PlaceDTO {
    
    init(weather: Weather) {
        let coordinate = CoordinateDTO(coordinate: weather.coordinate)
        
        self.init(id: weather.id, name: weather.name, countryCode: weather.meta.country, coordinate: coordinate)
    }

}
