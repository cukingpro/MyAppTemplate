//
//  Dependencies.swift
//  Config
//
//  Created by HuyTNH on 05/11/2023.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor(from: "5.8.1")),
        .remote(url: "https://github.com/QuickBirdEng/XCoordinator", requirement: .upToNextMajor(from: "2.2.1")),
        .remote(url: "https://github.com/uias/Pageboy", requirement: .upToNextMajor(from: "4.0.2")),
        .remote(url: "https://github.com/ReactiveX/RxSwift", requirement: .upToNextMajor(from: "6.6.0")),
        .remote(url: "https://github.com/SwifterSwift/SwifterSwift", requirement: .upToNextMajor(from: "6.0.0")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources", requirement: .upToNextMajor(from: "5.0.2")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxSwiftExt", requirement: .upToNextMajor(from: "6.2.1")),
        .remote(url: "https://github.com/jay-handhug/RxViewController", requirement: .branch("master")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxReachability", requirement: .upToNextMajor(from: "1.2.1")),
        .remote(url: "https://github.com/Moya/Moya", requirement: .upToNextMajor(from: "15.0.0")),
        .remote(url: "https://github.com/hackiftekhar/IQKeyboardManager", requirement: .branch("master")),
        .remote(url: "https://github.com/Swiftify-Corp/IHProgressHUD", requirement: .upToNextMajor(from: "0.1.8")),
        .remote(url: "https://github.com/RxSwiftCommunity/NSObject-Rx", requirement: .branch("master")),
        .remote(url: "https://github.com//cukingpro/ProgressHUD", requirement: .branch("13.8.6_animation-on-view")),
    ],
    platforms: [.iOS]
)
