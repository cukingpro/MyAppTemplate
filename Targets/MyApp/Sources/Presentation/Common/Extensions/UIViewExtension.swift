//
//  UIViewExtension.swift
//  MyApp
//
//  Created by HuyTNH on 01/12/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

extension UIView {
    func fillToSuperView(inset: UIEdgeInsets) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let left = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset.left)
            let right = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: inset.right)
            let top = topAnchor.constraint(equalTo: superview.topAnchor, constant: inset.top)
            let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: inset.bottom)
            NSLayoutConstraint.activate([left, right, top, bottom])
        }
    }
}
