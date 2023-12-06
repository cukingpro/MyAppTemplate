//
//  AppOTPFieldLabel.swift
//  MyApp
//
//  Created by HuyTNH on 06/12/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import CHIOTPField
import Foundation
import UIKit

final class AppOTPFieldLabel: UIView, POTPLabel {
    public var text: String? {
        didSet { label.text = text }
    }

    public var font: UIFont! {
        didSet { label.font = font }
    }

    public var active = false {
        didSet {
            updateActive(oldValue: oldValue, newValue: active)
        }
    }

    var borderColor: UIColor? {
        didSet { redraw() }
    }

    var cornerRadius: CGFloat = 0 {
        didSet { redraw() }
    }

    var placeholder: String? {
        didSet { redraw() }
    }

    var placeholderColor: UIColor? {
        didSet { redraw() }
    }

    public var textColor: UIColor! {
        didSet {
            self.label.textColor = textColor
        }
    }

    override public var backgroundColor: UIColor? {
        set {
            _backgroundColor = newValue
            layer.backgroundColor = newValue?.cgColor
        }
        get { return _backgroundColor }
    }

    var activeBackgroundColor = UIColor.white
    var filledBackgroundColor = UIColor.white

    var activeBorderColor: UIColor?
    var filledBorderColor: UIColor?

    private var animator = UIViewPropertyAnimator()
    private let label: UILabel
    private var _backgroundColor: UIColor?

    private var hasText: Bool {
        return self.text?.isEmpty == false
    }

    override init(frame: CGRect) {
        self.label = UILabel(frame: frame)
        super.init(frame: frame)
        addSubview(label)
        label.alpha = 0
        label.textAlignment = .center
        self.clipsToBounds = false
    }

    public func updateState() {
        stopAnimation()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateActive(oldValue: Bool, newValue: Bool) {
        guard oldValue != newValue else { return }

        if newValue == true {
            startAnimation()
        } else {
            stopAnimation()
        }
    }

    private func redraw() {
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = cornerRadius
        if let placeholder = placeholder {
            label.textColor = placeholderColor
            label.text = placeholder
            label.alpha = 1
        }
    }

    private func startAnimation() {
        animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.9, animations: {
            self.layer.borderColor = self.activeBorderColor?.cgColor ?? self.borderColor?.cgColor
            self.layer.backgroundColor = self.activeBackgroundColor.cgColor
            self.label.alpha = 0
        })
        animator.startAnimation()
    }

    private func stopAnimation() {
        animator.addAnimations {
            self.layer.borderColor = self.hasText ? (self.filledBorderColor?.cgColor ?? self.borderColor?.cgColor) : self.borderColor?.cgColor
            self.layer.backgroundColor = self.hasText ? self.filledBackgroundColor.cgColor : self._backgroundColor?.cgColor
            self.label.textColor = self.hasText ? self.textColor : self.placeholderColor
            self.label.text = self.text ?? self.placeholder
            self.label.alpha = 1
        }
        animator.startAnimation()
    }
}
