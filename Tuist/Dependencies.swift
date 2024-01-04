// swift-tools-version: 5.9

import ProjectDescription

let dependencies = Dependencies(
    carthage: [
        .github(path: "SwifterSwift/SwifterSwift", requirement: .upToNext("6.0")), // SwifterSwift crashes on SPM
        .github(path: "cukingpro/IQKeyboardManager", requirement: .branch("tuist-support")),
    ],
    swiftPackageManager: SwiftPackageManagerDependencies(),
    platforms: [.iOS]
)
