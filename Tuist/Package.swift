// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/QuickBirdEng/XCoordinator", .upToNextMajor(from: "2.2.1")),
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.6.0")),
        .package(url: "https://github.com/SwifterSwift/SwifterSwift", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources", .upToNextMajor(from: "5.0.2")),
        .package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt", .upToNextMajor(from: "6.2.1")),
        .package(url: "https://github.com/jay-handhug/RxViewController", branch: "master"),
        .package(url: "https://github.com/RxSwiftCommunity/RxReachability", .upToNextMajor(from: "1.2.1")),
        .package(url: "https://github.com/Moya/Moya", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardManager", .upToNextMajor(from: "7.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/NSObject-Rx", branch: "master"),
        .package(url: "https://github.com/cukingpro/ProgressHUD", branch: "13.8.6_animation-on-view"),
        .package(url: "https://github.com/devxoul/Then", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Boris-Em/BEMCheckBox", branch: "master"),
        .package(url: "https://github.com/marmelroy/PhoneNumberKit", from: "3.7.0"),
        .package(url: "https://github.com/ChiliLabs/CHIOTPField", branch: "master"),
        .package(url: "https://github.com/malcommac/ScrollStackController", from: "1.6.0"),
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.0")
    ]
)
