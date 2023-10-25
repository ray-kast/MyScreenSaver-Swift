// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MyScreenSaver",
    products: [
        .library(
            name: "MyScreenSaver",
            targets: ["MyScreenSaver"]),
        .executable(
            name: "driver",
            targets: ["Driver"]),
    ],
    targets: [
        .target(
            name: "MyScreenSaver"),
        .executableTarget(
            name: "Driver",
            dependencies: ["MyScreenSaver"]),
    ]
)
