// swift-tools-version:5.5
import PackageDescription

// Workaround for Xcode 13.2(.1) with Swift 5.5.2, but SwiftPM 5.5.0
#if swift(>=5.5.2)
let platforms: [SupportedPlatform] = [
    .macOS(.v10_15),
    .iOS(.v11)
]
#else
let platforms: [SupportedPlatform] = [
    .macOS(.v12),
    .iOS(.v15)
]
#endif


let package = Package(
    name: "async-kit",
    platforms: platforms,
    products: [
        .library(name: "AsyncKit", targets: ["AsyncKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.46.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "AsyncKit", dependencies: [
            .product(name: "Logging", package: "swift-log"),
            .product(name: "NIO", package: "swift-nio"),
        ]),
        .testTarget(name: "AsyncKitTests", dependencies: [
            .target(name: "AsyncKit"),
        ]),
    ]
)
