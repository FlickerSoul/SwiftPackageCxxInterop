// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageDirectory = Context.packageDirectory
let externalMathUtilsC = "\(packageDirectory)/Sources/ExternalMathUtilsC"
let cInclude = "\(externalMathUtilsC)/include"
let cLib = "\(externalMathUtilsC)/lib"
let cPk = "\(externalMathUtilsC)/math_utils.pk"

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
        .systemLibrary(name: "ExternalMathUtilsC", pkgConfig: cPk),
        .target(
            name: "MathUtilsCxx",
            dependencies: ["ExternalMathUtilsC"],
            cxxSettings: [
                .unsafeFlags(["-std=c++17"])
            ],
            linkerSettings: [
                .linkedLibrary("math_utils", .when(platforms: [.macOS])),
                .unsafeFlags(["-L\(cLib)"]),
            ]
        ),
        .target(
            name: "MathUtils",
            dependencies: ["ExternalMathUtilsC", "MathUtilsCxx"],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ],
            linkerSettings: [
                .linkedLibrary("math_utils", .when(platforms: [.macOS])),
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
