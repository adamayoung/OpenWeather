import Foundation

/// Weather.
public struct Weather: Identifiable {

    public var id: Int {
        place.id
    }
    
    /// The place this weather is for.
    public let place: Place
    /// Time zone.
    public let timeZone: TimeZone
    /// Weather conditions.
    public let conditions: [Condition]
    /// Temperature measurement, in Kelvin.
    public let temperature: Double
    /// Accounts for the human perception of temperature. in Kelvin.
    public let feelsLikeTemperature: Double
    /// Maximum temperature at the moment, in Kelvin. This is maximal currently observed temperature (within large megalopolises and urban areas).
    public let maximumTemperature: Double
    /// Minimum temperature at the moment, in Kelvin. This is minimal currently observed temperature (within large megalopolises and urban areas).
    public let minimumTemperature: Double
    /// Atmospheric pressure measurement, in hPa.
    public let pressure: Double
    /// Atmospheric pressure measurement on the sea level, in hPa.
    public let seaLevelPressure: Double?
    /// Atmospheric pressure measurement on the ground level, in hPa,
    public let groundLevelPressure: Double?
    /// Humidity, as a percentage.
    public let humidity: Double
    /// Visibility distaince measurement, in metres.
    public let visibility: Double
    /// Wind conditions.
    public let wind: WindMeasurement
    /// Cloudiness
    public let cloudiness: Double
    /// Rainfall measurements.
    public let rainfall: PrecipitationMeasurement?
    /// Snowfall measurements.
    public let snowfall: PrecipitationMeasurement?
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
    public init(place: Place, timeZone: TimeZone, conditions: [Condition], temperature: Double,
                feelsLikeTemperature: Double, maximumTemperature: Double, minimumTemperature: Double, pressure: Double,
                seaLevelPressure: Double?, groundLevelPressure: Double?, humidity: Double, visibility: Double,
                wind: WindMeasurement, cloudiness: Double, rainfall: PrecipitationMeasurement?,
                snowfall: PrecipitationMeasurement?, timestamp: Date) {
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
