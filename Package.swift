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
        .package(
            url: "https://github.com/thebrowsercompany/AnyURLSession",
            revision: "5d4e0109a868bd118acfb25910fb72aed3f0fa93")
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
