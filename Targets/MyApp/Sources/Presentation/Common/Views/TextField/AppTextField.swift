//
//  AppTextField.swift
//  MyApp
//
//  Created by HuyTNH on 27/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

class AppTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {
        backgroundColor = MyAppAsset.Colors.textFieldBackground.color
        textColor = MyAppAsset.Colors.textTitle100.color
        font = MyAppFontFamily.Urbanist.bold.font(size: 20)
        addPaddingLeft(24)
        addPaddingRight(24)
        borderStyle = .none
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layerCornerRadius = height / 2
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: width, height: 60)
    }
}

extension AppTextField {
    func setPlaceHolder(text: String,
                        color: UIColor = MyAppAsset.Colors.greyscale500.color,
                        font: UIFont = MyAppFontFamily.Urbanist.medium.font(size: 20)) {
        attributedPlaceholder = NSAttributedString(string: text,
                                                   attributes: [.foregroundColor: color, .font: font])
    }
}

