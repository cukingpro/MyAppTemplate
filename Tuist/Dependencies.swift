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
    ],
    platforms: [.iOS]
)
