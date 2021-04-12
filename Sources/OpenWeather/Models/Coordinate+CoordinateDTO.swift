import Foundation

extension Coordinate {
    
    init(dto: CoordinateDTO) {
        self.init(latitude: dto.latitude, longitude: dto.longitude)
    }
    
}
