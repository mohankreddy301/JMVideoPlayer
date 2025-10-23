// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JM_Video_Player_SDK",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        
        .library(
            name: "JM_Video_Player_SDK",
            targets: ["JM_Video_Player_SDK"]
        
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "JM_Video_Player_SDK",
        dependencies: [],
            // Add a linkage setting to ensure AVKit is linked to your product
            linkerSettings: [.linkedFramework("AVKit")]
        )
        

    ]
    
)
