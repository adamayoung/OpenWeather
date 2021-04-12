import Foundation

/// Weather condition.
public struct Condition: Identifiable {

    /// Weather condition identifier.
    public let id: Int
    /// Group of weather parameters.
    public let main: String
    /// Weather condition within the group.
    public let description: String
    /// Weather icon URL.
    public let iconURL: URL

    /// Creates a `ConditionDTO`.
    ///
    /// - Parameters:
    ///   - id: Weather condition identifier.
    ///   - main: Weather condition identifier.
    ///   - description: Weather condition within the group.
    ///   - iconURL: Weather icon URL.
    public init(id: Int, main: String, description: String, iconURL: URL) {
        self.id = id
        self.main = main
        self.description = description
        self.iconURL = iconURL
    }

}
