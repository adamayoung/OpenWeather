import Foundation

/// Precipitation measurement.
public struct PrecipitationMeasurementDTO {

    /// Precipitation in the last 1 hour.
    public let inLastHour: Measurement<UnitLength>
    /// Precipitation in the last 3 hours.
    public let inLastThreeHours: Measurement<UnitLength>

    /// Creates a new `PrecipitationMeasurementDTO`.
    ///
    /// - Parameters:
    ///   - inLastHour: Precipitation in the last 1 hour.
    ///   - inLastThreeHours: Precipitation in the last 3 hours.
    public init(inLastHour: Measurement<UnitLength>, inLastThreeHours: Measurement<UnitLength>) {
        self.inLastHour = inLastHour
        self.inLastThreeHours = inLastThreeHours
    }

}
