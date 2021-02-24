import Foundation

struct Condition: Decodable {

    static let iconBaseURL = URL(string: "http://openweathermap.org/img/wn")!

    let id: Int
    let main: String
    let description: String
    let icon: String

}
