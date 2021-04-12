import Foundation

struct ConditionDTO: Decodable {

    private static let iconBaseURL = URL(string: "http://openweathermap.org/img/wn")!

    let id: Int
    let main: String
    let description: String
    let icon: String

    var iconURL: URL {
        Self.iconBaseURL.appendingPathComponent("\(icon)@2x.png")
    }

}
