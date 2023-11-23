//
//  SplashViewController.swift
//  MyApp
//
//  Created by HuyTNH on 06/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit

final class SplashViewController: BaseViewController<SplashViewModel> {
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var loadingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        super.configureUI()
        backgroundImageView.image = MyAppAsset.Images.logo.image
        titleLabel.font = MyAppFontFamily.Urbanist.bold.font(size: 40)
        titleLabel.textColor = MyAppAsset.Colors.greyscale900.color
        titleLabel.text = MyAppStrings.qubikoAi
    }

    override func bindViewModel() {
        super.bindViewModel()
        let input = SplashViewModel.Input(viewDidLoad: rx.viewDidLoad.asDriver())
        let output = viewModel.transform(input)
        output.isLoading
            .drive(HUD.rx.isAnimating(on: loadingView))
            .disposed(by: rx.disposeBag)
    }
}
