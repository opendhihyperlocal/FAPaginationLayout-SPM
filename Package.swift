// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "FAPaginationLayout",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FAPaginationLayout",
            targets: ["FAPaginationLayout"]
        )
    ],
    targets: [
        .target(
            name: "FAPaginationLayout",
            path: "Sources/FAPaginationLayout"
        )
    ]
)
