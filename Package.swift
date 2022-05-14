// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PYLayout",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "PYLayout",
            targets: ["PYLayout"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMinor(from: "7.2.0")),
    ],
    targets: [
        .target(
            name: "PYLayout",
            dependencies: ["Kingfisher"],
            resources: [
                .copy("Resources/Fonts/Poppins/Poppins-Regular.ttf"),
                .copy("Resources/Fonts/Poppins/Poppins-Medium.ttf"),
                .copy("Resources/Fonts/Poppins/Poppins-SemiBold.ttf")
            ]),
        .testTarget(
            name: "PYLayoutTests",
            dependencies: ["PYLayout"]),
    ]
)
