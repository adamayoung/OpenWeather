import Foundation

/// Weather DTO.
public struct WeatherDTO: Identifiable {

    public var id: Int {
        place.id
    }
    
    /// The place this weather is for.
    public let place: PlaceDTO
    /// Time zone.
    public let timeZone: TimeZone
    /// Weather conditions.
    public let conditions: [ConditionDTO]
    /// Temperature measurement.
    public let temperature: Measurement<UnitTemperature>
    /// Accounts for the human perception of temperature.
    public let feelsLikeTemperature: Measurement<UnitTemperature>
    /// Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas).
    public let maximumTemperature: Measurement<UnitTemperature>
    /// Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas).
    public let minimumTemperature: Measurement<UnitTemperature>
    /// Atmospheric pressure measurement.
    public let pressure: Measurement<UnitPressure>
    /// Atmospheric pressure measurement on the sea level.
    public let seaLevelPressure: Measurement<UnitPressure>?
    /// Atmospheric pressure measurement on the ground level.
    public let groundLevelPressure: Measurement<UnitPressure>?
    /// Humidity, as a percentage.
    public let humidity: Double
    /// Visibility distaince measurement.
    public let visibility: Measurement<UnitLength>
    /// Wind conditions.
    public let wind: WindMeasurementDTO
    /// Cloudiness
    public let cloudiness: Double
    /// Rainfall measurements.
    public let rainfall: PrecipitationMeasurementDTO?
    /// Snowfall measurements.
    public let snowfall: PrecipitationMeasurementDTO?
    /// Timestamp.
    public let timestamp: Date

    /// Creates  a new `WeatherDTO`.
    ///
    /// - Parameters:
    ///   - place: The place this weather is for.
    ///   - timeZone: Time zone.
    ///   - conditions: Weather conditions.
    ///   - temperature: Temperature.
    ///   - feelsLikeTemperature: Accounts for the human perception of temperature.
    ///   - maximumTemperature: Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas).
    ///   - minimumTemperature: Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas).
    ///   - pressure: Atmospheric pressure.
    ///   - seaLevelPressure: Atmospheric pressure on the sea level.
    ///   - groundLevelPressure: Atmospheric pressure on the ground level.
    ///   - humidity: Humidity, as a percentage.
    ///   - visibility: Visibility.
    ///   - wind: Wind conditions.
    ///   - cloudiness: Cloudiness.
    ///   - rainfall: Rainfall measurement, if available.
    ///   - snowfall: Snowfall measurement, if available.
    ///   - timestamp: When the weather result was taken.
    public init(place: PlaceDTO, timeZone: TimeZone, conditions: [ConditionDTO],
                temperature: Measurement<UnitTemperature>, feelsLikeTemperature: Measurement<UnitTemperature>,
                maximumTemperature: Measurement<UnitTemperature>, minimumTemperature: Measurement<UnitTemperature>,
                pressure: Measurement<UnitPressure>, seaLevelPressure: Measurement<UnitPressure>?,
                groundLevelPressure: Measurement<UnitPressure>?, humidity: Double, visibility: Measurement<UnitLength>,
                wind: WindMeasurementDTO, cloudiness: Double, rainfall: PrecipitationMeasurementDTO?,
                snowfall: PrecipitationMeasurementDTO?, timestamp: Date) {
        self.place = place
        self.timeZone = timeZone
        self.conditions = conditions
        self.temperature = temperature
        self.feelsLikeTemperature = feelsLikeTemperature
        self.maximumTemperature = maximumTemperature
        self.minimumTemperature = minimumTemperature
        self.pressure = pressure
        self.seaLevelPressure = seaLevelPressure
        self.groundLevelPressure = groundLevelPressure
        self.humidity = humidity
        self.visibility = visibility
        self.wind = wind
        self.cloudiness = cloudiness
        self.rainfall = rainfall
        self.snowfall = snowfall
        self.timestamp = timestamp
    }

}
