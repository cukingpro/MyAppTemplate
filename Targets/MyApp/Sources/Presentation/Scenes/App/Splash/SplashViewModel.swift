//
//  SplashViewModel.swift
//  MyApp
//
//  Created by HuyTNH on 06/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import XCoordinator

final class SplashViewModel: ViewModelType {
    let router: UnownedRouter<AppRoute>
    let disposeBag = DisposeBag()

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
}

extension SplashViewModel {
    struct Input {}

    struct Output {}

    func transform(_ input: Input) -> Output {
        return Output()
    }
}
