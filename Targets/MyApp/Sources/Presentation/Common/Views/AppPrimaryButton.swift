//
//  AppPrimaryButton.swift
//  MyApp
//
//  Created by HuyTNH on 10/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

final class AppPrimaryButton: UIButton {
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
        configuration.baseBackgroundColor = MyAppAsset.Colors.primary.color
        configuration.baseForegroundColor = MyAppAsset.Colors.white.color
        configuration.cornerStyle = .capsule
        self.configuration = configuration
    }
}

extension UIButton {
    func setTitle(_ title: String) {
        var container = AttributeContainer()
        container.font = MyAppFontFamily.Urbanist.bold.font(size: 18)
        configuration?.attributedTitle = AttributedString(title, attributes: container)
    }
}
