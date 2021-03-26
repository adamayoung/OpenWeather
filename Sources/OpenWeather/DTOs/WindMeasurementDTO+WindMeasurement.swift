import Foundation

extension WindMeasurementDTO {

    init(wind: WindMeasurement) {
        let speed = Measurement(value: wind.speed, unit: UnitSpeed.metersPerSecond)
        let direction = Measurement(value: wind.direction, unit: UnitAngle.degrees)
        let gustSpeed: Measurement<UnitSpeed>? = {
            guard let gust = wind.gust else {
                return nil
            }

            return Measurement(value: gust, unit: UnitSpeed.metersPerSecond)
        }()

        self.init(speed: speed, direction: direction, gustSpeed: gustSpeed)
    }

}
