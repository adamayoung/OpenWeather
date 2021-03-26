import Foundation

extension WeatherDTO {

    init(weather: Weather) {
        let place = PlaceDTO(weather: weather)
        let timeZone = TimeZone(secondsFromGMT: weather.timezone)!
        let conditions = weather.conditions.map(ConditionDTO.init)
        let temperature = Measurement(value: weather.measurement.temperature, unit: UnitTemperature.kelvin)
        let feelsLikeTemperature = Measurement(value: weather.measurement.feelsLikeTemperature,
                                               unit: UnitTemperature.kelvin)
        let maximumTemperature = Measurement(value: weather.measurement.maximumTemperature,
                                             unit: UnitTemperature.kelvin)
        let minimumTemperature = Measurement(value: weather.measurement.minimumTemperature,
                                             unit: UnitTemperature.kelvin)
        let pressure = Measurement(value: weather.measurement.pressure, unit: UnitPressure.hectopascals)
        let seaLevelPressure: Measurement<UnitPressure>? = {
            guard let seaLevelPressure = weather.measurement.seaLevelPressure else {
                return nil
            }

            return Measurement(value: seaLevelPressure, unit: UnitPressure.hectopascals)
        }()
        let groundLevelPressure: Measurement<UnitPressure>? = {
            guard let groundLevelPressure = weather.measurement.groundLevelPressure else {
                return nil
            }

            return Measurement(value: groundLevelPressure, unit: UnitPressure.hectopascals)
        }()
        let visibility = Measurement(value: weather.visibility, unit: UnitLength.meters)
        let wind = WindMeasurementDTO(wind: weather.wind)
        let rainfall: PrecipitationMeasurementDTO? = {
            guard let rainfall = weather.rainfall else {
                return nil
            }

            return PrecipitationMeasurementDTO(precipitation: rainfall)
        }()
        let snowfall: PrecipitationMeasurementDTO? = {
            guard let snowfall = weather.snowfall else {
                return nil
            }

            return PrecipitationMeasurementDTO(precipitation: snowfall)
        }()

        self.init(place: place, timeZone: timeZone, conditions: conditions, temperature: temperature,
                  feelsLikeTemperature: feelsLikeTemperature, maximumTemperature: maximumTemperature,
                  minimumTemperature: minimumTemperature, pressure: pressure, seaLevelPressure: seaLevelPressure,
                  groundLevelPressure: groundLevelPressure, humidity: weather.measurement.humidity,
                  visibility: visibility, wind: wind, cloudiness: weather.cloud.cloudiness, rainfall: rainfall,
                  snowfall: snowfall, timestamp: weather.timestamp)
    }

}
