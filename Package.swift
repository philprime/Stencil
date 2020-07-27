// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Stencil",
    products: [
        .library(name: "Stencil", targets: ["Stencil"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "2.2.0")),
        .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "8.0.7"))
    ],
    targets: [
        .target(name: "Stencil", dependencies: []),
        .testTarget(name: "StencilTests", dependencies: [
            "Stencil",
            "Quick",
            "Nimble"
        ]),
    ]
)
