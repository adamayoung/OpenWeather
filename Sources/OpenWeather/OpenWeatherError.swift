import Foundation

public struct OpenWeatherError: LocalizedError, Decodable {

    let code: String
    let message: String

    public var errorDescription: String? {
        return message
    }

    init(code: String = "", message: String) {
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
