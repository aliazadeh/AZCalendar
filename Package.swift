// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AZCalendar",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "AZCalendar",
            targets: ["AZCalendar"]
        ),
    ],
    targets: [
        .target(
            name: "AZCalendar",
            path: "Sources/AZCalendar"
        ),
        .testTarget(
            name: "AZCalendarTests",
            dependencies: ["AZCalendar"],
            path: "Tests/AZCalendarTests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)

