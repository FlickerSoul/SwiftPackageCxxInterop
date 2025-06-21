// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

struct Lib {
    let base: String
    let pkName: String?
    
    var include: String {
        return "\(base)/include"
    }
    
    var lib: String {
        return "\(base)/lib"
    }
    
    var pkgConfig: String? {
        return pkName.map { "\(base)/\($0)" }
    }
}

let packageDirectory = Context.packageDirectory
let externalMathUtilsC = Lib(base: "\(packageDirectory)/Sources/ExternalMathUtilsC", pkName: "math_utils.pk")
let externalMathUtilsCxx = Lib(base: "\(packageDirectory)/Sources/ExternalMathUtilsCxx", pkName: nil)

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
        .systemLibrary(name: "ExternalMathUtilsC", pkgConfig: externalMathUtilsC.pkgConfig),
        .systemLibrary(name: "ExternalMathUtilsCxx", pkgConfig: externalMathUtilsCxx.pkgConfig),
        .target(
            name: "MathUtilsCxx",
            dependencies: ["ExternalMathUtilsC"],
            cxxSettings: [
                .unsafeFlags(["-std=c++17"])
            ],
            linkerSettings: [
                .linkedLibrary("math_utils", .when(platforms: [.macOS])),
                .unsafeFlags(["-L\(externalMathUtilsC.lib)"]),
            ]
        ),
        .target(name: "MathUtilsC"),
        .target(
            name: "MathUtils",
            dependencies: ["ExternalMathUtilsC", "ExternalMathUtilsCxx", "MathUtilsC", "MathUtilsCxx"],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ],
            linkerSettings: [
                .linkedLibrary("math_utils", .when(platforms: [.macOS])),
                .unsafeFlags(["-L\(externalMathUtilsC.lib)"]),
                .linkedLibrary("complexmath", .when(platforms: [.macOS])),
                .unsafeFlags(["-L\(externalMathUtilsCxx.lib)"]),
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
    ],
    cLanguageStandard: .c17,
    cxxLanguageStandard: .cxx17
)
