//
//  AppSecondaryButton.swift
//  MyApp
//
//  Created by HuyTNH on 23/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit
import SwifterSwift

final class AppSecondaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = MyAppAsset.Colors.neutral.color
        configuration.baseForegroundColor = MyAppAsset.Colors.primary.color
        configuration.cornerStyle = .capsule
        self.configuration = configuration
    }
}
