import Foundation

extension PrecipitationMeasurement {

    init(dto: PrecipitationMeasurementDTO) {
        self.init(inLastHour: dto.inLastHour, inLastThreeHours: dto.inLastThreeHours)
    }

    init?(dto: PrecipitationMeasurementDTO?) {
        guard let dto = dto else {
            return nil
        }

        self.init(dto: dto)
    }

}
