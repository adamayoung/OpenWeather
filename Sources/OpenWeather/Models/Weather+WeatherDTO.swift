import Foundation

extension Weather {

    init(dto: WeatherDTO) {
        let place = Place(dto: dto)
        let timeZone = TimeZone(secondsFromGMT: dto.timezone)!
        let conditions = dto.conditions.map(Condition.init)
        let wind = WindMeasurement(dto: dto.wind)
        let rainfall = PrecipitationMeasurement(dto: dto.rainfall)
        let snowfall = PrecipitationMeasurement(dto: dto.snowfall)

        self.init(place: place, timeZone: timeZone, conditions: conditions, temperature: dto.measurement.temperature,
                  feelsLikeTemperature: dto.measurement.feelsLikeTemperature,
                  maximumTemperature: dto.measurement.maximumTemperature,
                  minimumTemperature: dto.measurement.minimumTemperature, pressure: dto.measurement.pressure,
                  seaLevelPressure: dto.measurement.seaLevelPressure,
                  groundLevelPressure: dto.measurement.groundLevelPressure, humidity: dto.measurement.humidity,
                  visibility: dto.visibility, wind: wind, cloudiness: dto.cloud.cloudiness, rainfall: rainfall,
                  snowfall: snowfall, timestamp: dto.timestamp)
    }

}
