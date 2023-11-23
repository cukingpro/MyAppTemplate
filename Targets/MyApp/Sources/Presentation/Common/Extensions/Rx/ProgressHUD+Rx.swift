//
//  ProgressHUD+Rx.swift
//  MyApp
//
//  Created by HuyTNH on 23/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import RxCocoa
import ProgressHUD
import RxSwift
import UIKit

extension Reactive where Base: ProgressHUD {
    static var isAnimating: Binder<Bool> {
        return Binder(UIApplication.shared) { _, isVisible in
            if isVisible {
                ProgressHUD.show()
            } else {
                ProgressHUD.dismiss()
            }
        }
    }
    
    static func isAnimating(on parentView: UIView) -> Binder<Bool> {
        return Binder(UIApplication.shared) { _, isVisible in
            if isVisible {
                ProgressHUD.showAnimation(on: parentView)
            } else {
                ProgressHUD.dismiss()
            }
        }
    }
}
