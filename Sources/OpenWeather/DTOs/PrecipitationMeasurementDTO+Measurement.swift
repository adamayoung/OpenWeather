import Foundation

extension PrecipitationMeasurementDTO {

    init(precipitation: PrecipitationMeasurement) {
        let inLastHour = Measurement(value: precipitation.inLastHour, unit: UnitLength.millimeters)
        let inLastThreeHours = Measurement(value: precipitation.inLastHour, unit: UnitLength.millimeters)

        self.init(inLastHour: inLastHour, inLastThreeHours: inLastThreeHours)
    }

}
