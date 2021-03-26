import Foundation

extension PrecipitationMeasurementDTO {

    init(precipitation: PrecipitationMeasurement) {
        let inLastHour = Measurement(value: precipitation.inLastHour, unit: UnitLength.millimeters)
        let inLastThreeHours:  Measurement<UnitLength>? = {
            guard let inLastThreeHours = precipitation.inLastThreeHours else {
                return nil
            }
            
            return Measurement(value: inLastThreeHours, unit: UnitLength.millimeters)
        }()

        self.init(inLastHour: inLastHour, inLastThreeHours: inLastThreeHours)
    }

}
