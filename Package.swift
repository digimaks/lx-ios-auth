// SPDX-License-Identifier: EUPL-1.2

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthWrapperPackage",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AuthWrapperPackage",
            targets: ["AuthWrapperPackage"]),
    ],
    dependencies: [
        // Added dependency on local UtilitiesPackage
        .package(path: "../UtilitiesPackage/UtilitiesPackage"),
        // Added dependency on local KeychainWrapperPackage
        .package(path: "../KeychainWrapperPackage/KeychainWrapperPackage")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AuthWrapperPackage",
            dependencies: [
                // Depend on the products exported by the local packages
                .product(name: "UtilitiesPackage", package: "UtilitiesPackage"),
                .product(name: "KeychainWrapperPackage", package: "KeychainWrapperPackage")
            ]),

    ]
)
