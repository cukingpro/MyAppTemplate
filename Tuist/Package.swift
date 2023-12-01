//
//  Package.swift
//  Manifests
//
//  Created by HuyTNH on 25/11/2023.
//

import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/QuickBirdEng/XCoordinator", .upToNextMajor(from: "2.2.1")),
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.6.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources", .upToNextMajor(from: "5.0.2")),
        .package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt", .upToNextMajor(from: "6.2.1")),
        .package(url: "https://github.com/jay-handhug/RxViewController", branch: "master"),
        .package(url: "https://github.com/RxSwiftCommunity/RxReachability", .upToNextMajor(from: "1.2.1")),
        .package(url: "https://github.com/Moya/Moya", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/Swiftify-Corp/IHProgressHUD", .upToNextMajor(from: "0.1.8")),
        .package(url: "https://github.com/RxSwiftCommunity/NSObject-Rx", branch: "master"),
        .package(url: "https://github.com/cukingpro/ProgressHUD", branch: "13.8.6_animation-on-view"),
        .package(url: "https://github.com/devxoul/Then", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Boris-Em/BEMCheckBox", branch: "master"),
        .package(url: "https://github.com/marmelroy/PhoneNumberKit", from: "3.7.0")
    ]
)
