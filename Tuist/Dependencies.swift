//
//  Dependencies.swift
//  Config
//
//  Created by HuyTNH on 05/11/2023.
//

import ProjectDescription

let dependencies = Dependencies(
    carthage: [
        .github(path: "SwifterSwift/SwifterSwift", requirement: .upToNext("6.0")), // SwifterSwift crashes on SPM
    ],
    swiftPackageManager: SwiftPackageManagerDependencies(),
    platforms: [.iOS]
)
