// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-text-ownership",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Text Ownership",
            targets: ["Text Ownership"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-text.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ownership.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-byte.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Text Ownership",
            dependencies: [
                .product(name: "Text", package: "swift-text"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Byte", package: "swift-byte"),
            ]
        ),
        .testTarget(
            name: "Text Ownership Tests",
            dependencies: [
                "Text Ownership"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
