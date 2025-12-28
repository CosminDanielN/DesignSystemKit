// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystemKit",
    platforms: [
        .iOS(.v26)
    ],
    products: [
        .library(
            name: "DesignSystemKit",
            targets: ["DesignSystemKit"]
        ),
    ],
    targets: [
        .target(
            name: "DesignSystemKit",
            swiftSettings: [
                .swiftLanguageMode(.v6),
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
                .enableUpcomingFeature("StrictConcurrency"),
            ]
        ),
        .testTarget(
            name: "DesignSystemKitTests",
            dependencies: ["DesignSystemKit"],
            swiftSettings: [
                .swiftLanguageMode(.v6),
                .enableUpcomingFeature("StrictConcurrency"),
            ]
        ),
    ]
)
