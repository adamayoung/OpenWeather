import Foundation

public extension URL {

    func appendingQueryItem(name: String, value: CustomStringConvertible) -> Self {
        let queryItem = URLQueryItem(name: name, value: value.description)
        return appendingQueryItems([queryItem])
    }

    func appendingQueryItems(_ queryItems: [URLQueryItem]) -> Self {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        var items = urlComponents.queryItems ?? []
        items.append(contentsOf: queryItems)
        urlComponents.queryItems = items
        return urlComponents.url!
    }

    func appendingAPIKey(apiKey: String) -> Self {
        return appendingQueryItem(name: "appid", value: apiKey)
    }

}
