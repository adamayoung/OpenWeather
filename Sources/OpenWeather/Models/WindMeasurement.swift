import Foundation

/// Wind measurement.
public struct WindMeasurement {

    /// Wind speed measurement, in metre/second.
    public let speed: Double
    /// Wind direction measurement, in degrees.
    public let direction: Double
    /// Wind gust speed measurement, in metre/second.
    public let gustSpeed: Double?

    /// Creates a new `WindDTO`.
    ///
    /// - Parameters:
    ///   - speed: Wind speed measurement, in metre/second.
    ///   - direction: Wind direction measurement. in degrees.
    ///   - gustSpeed: Wind gust speed measurement, in metre/second.
    public init(speed: Double, direction: Double, gustSpeed: Double? = nil) {
        self.speed = speed
        self.direction = direction
        self.gustSpeed = gustSpeed
    }

}
