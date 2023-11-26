//
//  BaseNavigationController.swift
//  MyApp
//
//  Created by HuyTNH on 06/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: MyAppAsset.Colors.greyscale900.color,
            .font: MyAppFontFamily.Urbanist.bold.font(size: 24)
        ]
        navigationBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: MyAppAsset.Colors.greyscale900.color,
            .font: MyAppFontFamily.Urbanist.bold.font(size: 32)
        ]

        let backImage = MyAppAsset.Images.backIcon.image
        navigationBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        UIBarButtonItem.appearance().tintColor = MyAppAsset.Colors.greyscale900.color

        navigationBar.prefersLargeTitles = true
        navigationBar.layoutMargins.left = 24
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.compactAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
            navigationBar.compactScrollEdgeAppearance = navigationBarAppearance
        }
    }
}
