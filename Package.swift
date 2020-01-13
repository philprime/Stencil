// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Stencil",
    products: [
        .library(
            name: "Stencil",
            targets: ["Stencil"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Stencil",
            dependencies: []),
        .testTarget(
            name: "StencilTests",
            dependencies: ["Stencil"]),
    ]
)
