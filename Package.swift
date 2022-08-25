// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Purace",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Purace",
            targets: ["Purace"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMinor(from: "7.2.0")),
        .package(url: "https://github.com/GeorgeElsham/ViewExtractor", .exact("1.1.0")),
        .package(url: "https://github.com/exyte/PopupView.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Purace",
            dependencies: ["Kingfisher", "ViewExtractor", "PopupView"],
            resources: [
                .copy("Resources/Fonts/Poppins/Poppins-Regular.ttf"),
                .copy("Resources/Fonts/Poppins/Poppins-Medium.ttf"),
                .copy("Resources/Fonts/Poppins/Poppins-SemiBold.ttf")
            ]),
    ]
)
