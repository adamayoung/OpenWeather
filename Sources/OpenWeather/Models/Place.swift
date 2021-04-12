import Foundation

/// A place.
public struct Place: Identifiable {

    /// Place identifier.
    public let id: Int
    /// Place name.
    public let name: String
    /// Place country code.
    public let countryCode: String
    /// Place coordinate.
    public let coordinate: Coordinate

}
