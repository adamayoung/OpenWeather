// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenWeather",

    products: [
        .library(name: "OpenWeather", targets: ["OpenWeather"])
    ],

    targets: [
        .target(
            name: "OpenWeather",
            dependencies: [],
            resources: [
                .copy("Data")
            ]
        ),
        .testTarget(name: "OpenWeatherTests", dependencies: ["OpenWeather"])
    ]
)
