//
//  AppOTPField.swift
//  MyApp
//
//  Created by HuyTNH on 06/12/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import CHIOTPField
import UIKit

final class AppOTPField: CHIOTPField<AppOTPFieldLabel> {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }

    // background color of the box in normal state
    @IBInspectable
    public var boxBackgroundColor: UIColor = .init(hexString: "FAFAFA")! {
        didSet { redraw() }
    }

    // background color of the box in active state
    @IBInspectable
    public var activeBoxBackgroundColor: UIColor = .init(hexString: "FAFAFA")! {
        didSet { redraw() }
    }

    // background color of the box if a text is entered
    @IBInspectable
    public var filledBoxBackgroundColor: UIColor = MyAppAsset.Colors.neutral.color {
        didSet { redraw() }
    }

    // border color of the box in normal state
    @IBInspectable
    public var borderColor: UIColor = MyAppAsset.Colors.border.color {
        didSet { redraw() }
    }

    // border color of the box in active
    @IBInspectable
    public var activeBorderColor: UIColor? = MyAppAsset.Colors.primary.color {
        didSet { redraw() }
    }

    // border color of the box if a text is entered
    @IBInspectable
    public var filledBorderColor: UIColor? {
        didSet { redraw() }
    }

    @IBInspectable
    public var cornerRadius: CGFloat = 16 {
        didSet { redraw() }
    }

    // placeholder text
    @IBInspectable
    public var boxPlaceholder: String? {
        didSet { redraw() }
    }

    // placeholder text color
    @IBInspectable
    public var boxPlaceholderColor: UIColor? = .lightGray {
        didSet { redraw() }
    }

    @IBInspectable
    public var otpColor: UIColor? = MyAppAsset.Colors.greyscale900.color {
        didSet { redraw() }
    }

    override public func redraw() {
        super.redraw()
        labels.forEach { label in
            label.backgroundColor = boxBackgroundColor
            label.activeBackgroundColor = activeBoxBackgroundColor
            label.filledBackgroundColor = filledBoxBackgroundColor
            label.activeBorderColor = activeBorderColor
            label.borderColor = borderColor
            label.cornerRadius = cornerRadius
            label.filledBorderColor = filledBorderColor
            label.placeholder = boxPlaceholder
            label.placeholderColor = boxPlaceholderColor
            label.textColor = otpColor
        }
    }

    private func setupDefault() {
        font = MyAppFontFamily.Urbanist.bold.font(size: 24)
        numberOfDigits = 4
    }
}
