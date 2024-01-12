// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//MARK: - Package
let package = Package(
    name: "Nexus",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "Nexus", targets: ["Nexus"]),
        .library(name: "HomeScene", targets: ["HomeScene"]),
        Dependencies.APIManager.library,
    ],
    targets: [
        Dependencies.APIManager.target,
        .target(name: "Nexus"),
        .target(
            name: "HomeScene",
        dependencies: [Dependencies.APIManager.dependency,]),
        .testTarget(
            name: "NexusTests",
            dependencies: ["Nexus"]),
    ]
)

//MARK: - Dependencies
fileprivate enum Dependencies {
    case APIManager
    
    var library: Product {
        switch self {
        case .APIManager: return .library(name: "APIManager", targets: ["APIManager"])
        }
    }
    
    var target: Target {
        switch self {
        case .APIManager: return .target(name: "APIManager")
        }
    }
    
    var dependency: Target.Dependency {
        switch self {
        case .APIManager: return "APIManager"
        }
    }
}
