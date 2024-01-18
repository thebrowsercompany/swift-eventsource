// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "LDSwiftEventSource",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11)
    ],
    products: [
        .library(name: "LDSwiftEventSource", targets: ["LDSwiftEventSource"]),
    ],
    dependencies: [
        .package(url: "https://github.com/thebrowsercompany/AnyURLSession", revision: "9b8e39b")
    ],
    targets: [
        .target(
            name: "LDSwiftEventSource",
            dependencies: [
                .product(name: "AnyURLSession", package: "AnyURLSession")
            ],
            path: "Source"),
        .testTarget(
            name: "LDSwiftEventSourceTests",
            dependencies: ["LDSwiftEventSource"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5])
