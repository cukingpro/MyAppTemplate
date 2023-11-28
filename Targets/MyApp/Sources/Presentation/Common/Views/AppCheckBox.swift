//
//  AppCheckBox.swift
//  MyApp
//
//  Created by HuyTNH on 28/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import BEMCheckBox
import UIKit

extension BEMCheckBox {
    func configureUI() {
        self.do {
            $0.lineWidth = 3
            $0.cornerRadius = 6
            $0.boxType = .square

            $0.onTintColor = MyAppAsset.Colors.primary.color
            $0.onFillColor = MyAppAsset.Colors.primary.color
            $0.onCheckColor = MyAppAsset.Colors.white.color
            $0.onAnimationType = .bounce

            $0.tintColor = MyAppAsset.Colors.primaryDark.color
            $0.offFillColor = MyAppAsset.Colors.white.color
            $0.offAnimationType = .bounce
        }
    }
}
