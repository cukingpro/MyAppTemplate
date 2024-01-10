//
//  BaseTabBarController.swift
//  MyApp
//
//  Created by HuyTNH on 06/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
    }
    
    func setupTabbar() {
        tabBar.tintColor = MyAppAsset.Colors.primary.color
        tabBar.unselectedItemTintColor = MyAppAsset.Colors.greyscale500.color
    }
}
