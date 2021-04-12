import Foundation

/// Precipitation measurement.
public struct PrecipitationMeasurement {

    /// Precipitation in the last 1 hour, in millimetres.
    public let inLastHour: Double
    /// Precipitation in the last 3 hours, in millimetres.
    public let inLastThreeHours: Double?

    /// Creates a new `PrecipitationMeasurementDTO`.
    ///
    /// - Parameters:
    ///   - inLastHour: Precipitation in the last 1 hour, in millimetres.
    ///   - inLastThreeHours: Precipitation in the last 3 hours, in millimetres.
    public init(inLastHour: Double, inLastThreeHours: Double? = nil) {
        self.inLastHour = inLastHour
        self.inLastThreeHours = inLastThreeHours
    }

}
