import CoreLocation
import Foundation

/// Wind measurement.
public struct WindMeasurementDTO {

    /// Wind speed measurement.
    public let speed: Measurement<UnitSpeed>
    /// Wind direction measurement.
    public let direction: CLLocationDirection
    /// Wind gust speed measurement.
    public let gustSpeed: Measurement<UnitSpeed>?

    /// Creates a new `WindDTO`.
    ///
    /// - Parameters:
    ///   - speed: Wind speed measurement.
    ///   - direction: Wind direction measurement.
    ///   - gustSpeed: Wind gust speed measurement.
    public init(speed: Measurement<UnitSpeed>, direction: CLLocationDirection,
                gustSpeed: Measurement<UnitSpeed>? = nil) {
        self.speed = speed
        self.direction = direction
        self.gustSpeed = gustSpeed
    }

}
