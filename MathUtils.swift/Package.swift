// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageDirectory = Context.packageDirectory
let cLibrary = "\(packageDirectory)/Sources/MathUtilsC"
let cInclude = "\(cLibrary)/include"
let cLib = "\(cLibrary)/lib"

let package = Package(
    name: "MathUtils.swift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MathUtils",
            targets: ["MathUtils"]
        ),
        .executable(name: "MathUtilsExecutable", targets: ["MathUtilsExecutable"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .systemLibrary(name: "MathUtilsC", pkgConfig: "\(cLibrary)/math_utils.pk"),
        .target(
            name: "MathUtilsCxx",
            dependencies: ["MathUtilsC"],
            cxxSettings: [
                .unsafeFlags(["-std=c++17"])
            ],
            linkerSettings: [
                .linkedLibrary("math_utils"),
                .unsafeFlags(["-L\(cLib)"]),
            ]
        ),
        .target(
            name: "MathUtils",
            dependencies: ["MathUtilsC", "MathUtilsCxx"],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ],
            linkerSettings: [
                .linkedLibrary("math_utils"),
                .unsafeFlags(["-L\(cLib)"]),
            ],
        ),
        .executableTarget(
            name: "MathUtilsExecutable",
            dependencies: ["MathUtils"],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ],
        ),
        .testTarget(
            name: "MathUtilsTests",
            dependencies: ["MathUtils"]
        ),
    ]
)
