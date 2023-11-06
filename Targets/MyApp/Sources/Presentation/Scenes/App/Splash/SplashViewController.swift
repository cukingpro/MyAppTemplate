//
//  SplashViewController.swift
//  MyApp
//
//  Created by HuyTNH on 06/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController<SplashViewModel> {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = MyAppAsset.Images.splash.image
        backgroundImageView.contentMode = .scaleAspectFill
        titleLabel.font = MyAppFontFamily.SFProDisplay.bold.font(size: 32)
        titleLabel.textColor = MyAppAsset.Colors.white.color
        titleLabel.text = MyAppStrings.welcomeTo("MyApp Template")
    }
}
