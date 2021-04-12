import Foundation

struct OpenWeatherResponseError: Error, Decodable {

    let code: String
    let message: String

    init(code: String, message: String) {
        self.code = code
        self.message = message
    }

}

extension OpenWeatherError {

    private enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
    }

}
