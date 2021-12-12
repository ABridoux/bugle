// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bugle",
    platforms: [.macOS("10.13")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Bugle",
            targets: ["Bugle"]),
        .executable(
            name: "BugleCLT",
            targets: ["BugleCLT"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Bugle",
            resources: [.copy("Resources/DomainRecords")]),
        .target(
            name: "BugleCLT",
            dependencies: [
                "Bugle",
                .product(name: "ArgumentParser", package: "swift-argument-parser")])
        ,
        .testTarget(
            name: "BugleTests",
            dependencies: ["Bugle"])
    ]
)
