//
//  AppButton.swift
//  MyApp
//
//  Created by HuyTNH on 25/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import Then
import UIKit

class AppButton: UIButton {
    var buttonFont: UIFont {
        MyAppFontFamily.Urbanist.bold.font(size: 18)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {}
}

extension AppButton {
    func setTitle(_ title: String) {
        let container = AttributeContainer().with {
            $0.font = buttonFont
        }
        configuration?.attributedTitle = AttributedString(title, attributes: container)
    }

    func setImage(_ image: UIImage) {
        configuration?.image = image
    }
}

final class AppPrimaryButton: AppButton {
    override func setupUI() {
        super.setupUI()
        let configuration = UIButton.Configuration.filled().with {
            $0.cornerStyle = .capsule
            $0.baseBackgroundColor = MyAppAsset.Colors.primary.color
            $0.baseForegroundColor = MyAppAsset.Colors.white.color
        }
        self.configuration = configuration
    }
}

final class AppSecondaryButton: AppButton {
    override func setupUI() {
        super.setupUI()
        let configuration = UIButton.Configuration.filled().with {
            $0.cornerStyle = .capsule
            $0.baseBackgroundColor = MyAppAsset.Colors.white.color
            $0.baseForegroundColor = MyAppAsset.Colors.primary.color
            $0.background.strokeWidth = 1
            $0.background.strokeColor = MyAppAsset.Colors.border.color
        }
        self.configuration = configuration
    }
}

final class AppTertiaryButton: AppButton {
    override func setupUI() {
        super.setupUI()
        let configuration = UIButton.Configuration.filled().with {
            $0.cornerStyle = .capsule
            $0.baseBackgroundColor = MyAppAsset.Colors.neutral.color
            $0.baseForegroundColor = MyAppAsset.Colors.primary.color
            $0.background.strokeWidth = 1
            $0.background.strokeColor = MyAppAsset.Colors.border.color
        }
        self.configuration = configuration
    }
}

final class AppTextButton: AppButton {
    override var buttonFont: UIFont {
        MyAppFontFamily.Urbanist.bold.font(size: 16)
    }

    override func setupUI() {
        super.setupUI()
        let configuration = UIButton.Configuration.plain().with {
            $0.baseBackgroundColor = MyAppAsset.Colors.white.color
            $0.baseForegroundColor = MyAppAsset.Colors.primaryDark.color
            $0.contentInsets = .zero
        }
        self.configuration = configuration
    }
}

extension UIButton.Configuration: Then {}
extension AttributeContainer: Then {}
