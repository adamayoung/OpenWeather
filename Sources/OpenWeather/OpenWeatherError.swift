import Foundation

public enum OpenWeatherError: Error {

    case network(URLError)
    case unauthorized
    case notFound
    case unknown
    case decode(Error)

}

extension OpenWeatherError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .network(let urlError):
            return urlError.localizedDescription

        case .unauthorized:
            return "Unauthorised"

        case .notFound:
            return "Not Found"

        case .unknown:
            return "Unknown Error"

        case .decode:
            return "Data Decode Error"
        }
    }

}
