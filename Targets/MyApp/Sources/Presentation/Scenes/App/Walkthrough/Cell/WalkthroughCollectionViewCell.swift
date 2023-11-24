//
//  WalkthroughCollectionViewCell.swift
//  MyApp
//
//  Created by HuyTNH on 23/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

final class WalkthroughCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
        }
        titleLabel.do {
            $0.numberOfLines = 0
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.font = MyAppFontFamily.Urbanist.bold.font(size: 32)
        }
        subtitleLabel.do {
            $0.numberOfLines = 0
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.font = MyAppFontFamily.Urbanist.regular.font(size: 18)
        }
    }
    
    func bind(_ item: WalkthroughModel) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        imageView.image = item.image
    }

}
