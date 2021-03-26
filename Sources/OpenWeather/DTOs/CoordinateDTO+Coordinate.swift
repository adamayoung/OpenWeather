import Foundation

extension CoordinateDTO {
    
    init(coordinate: Coordinate) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
}
