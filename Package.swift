// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenWeather",

    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],

    products: [
        .library(name: "OpenWeather", targets: ["OpenWeather"])
    ],

    targets: [
        .target(name: "OpenWeather", dependencies: []),
        .testTarget(name: "OpenWeatherTests", dependencies: ["OpenWeather"])
    ]
)
