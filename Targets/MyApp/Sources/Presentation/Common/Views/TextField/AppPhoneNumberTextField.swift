//
//  AppPhoneNumberTextField.swift
//  MyApp
//
//  Created by HuyTNH on 30/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import Foundation
import PhoneNumberKit
import UIKit

final class AppPhoneNumberTextField: PhoneNumberTextField {
    var flagButtonPadding: CGFloat = 24
    
    var placeholderFont: UIFont {
        MyAppFontFamily.Urbanist.medium.font(size: 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override var defaultRegion: String {
        get {
            if #available(iOS 16, *) {
                return Locale.current.language.region?.identifier ?? "US"
            } else {
                return Locale.current.regionCode ?? "US"
            }
        }
        set {}
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: width, height: 60)
    }
    
    private func setupUI() {
        backgroundColor = MyAppAsset.Colors.textFieldBackground.color
        textColor = MyAppAsset.Colors.textTitle100.color
        font = MyAppFontFamily.Urbanist.bold.font(size: 20)
        borderStyle = .none
        numberPlaceholderColor = MyAppAsset.Colors.greyscale500.color
        withFlag = true
        withExamplePlaceholder = true
        withDefaultPickerUI = true
        withPrefix = false
        flagButton.anchor(widthConstant: 60, heightConstant: 60)
        flagButton.titleLabel?.textAlignment = .center
        
        let options = CountryCodePickerOptions(
            backgroundColor: MyAppAsset.Colors.white.color,
            separatorColor: .blue,
            textLabelColor: MyAppAsset.Colors.textTitle100.color,
            textLabelFont: MyAppFontFamily.Urbanist.medium.font(size: 20),
            detailTextLabelColor: MyAppAsset.Colors.textTitle100.color,
            detailTextLabelFont: MyAppFontFamily.Urbanist.medium.font(size: 20),
            tintColor: .red,
            cellBackgroundColor: MyAppAsset.Colors.textFieldBackground.color,
            cellBackgroundColorSelection: .yellow
        )
        withDefaultPickerUIOptions = options
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layerCornerRadius = height / 2
    }
    
    override func updatePlaceholder() {
        super.updatePlaceholder()
        guard let attributedPlaceholder = attributedPlaceholder else { return }
        let mutableAttributedPlaceholder = NSMutableAttributedString(attributedString: attributedPlaceholder)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: placeholderFont,
            .foregroundColor: numberPlaceholderColor,
        ]
        mutableAttributedPlaceholder.addAttributes(
            attributes,
            range: NSRange(location: 0, length: mutableAttributedPlaceholder.length)
        )
        self.attributedPlaceholder = mutableAttributedPlaceholder
    }
}
