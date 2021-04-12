import Foundation

extension WindMeasurement {

    init(dto: WindMeasurementDTO) {
        self.init(speed: dto.speed, direction: dto.direction, gustSpeed: dto.gust)
    }

}
