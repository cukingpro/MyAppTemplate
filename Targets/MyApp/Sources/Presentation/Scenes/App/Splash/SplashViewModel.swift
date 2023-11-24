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
    struct Input {
        let viewDidLoad: Driver<Void>
    }

    struct Output {
        let isLoading: Driver<Bool>
    }

    func transform(_ input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        Driver.just(())
            .delay(.seconds(1))
            .trackActivity(activityIndicator)
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.router.trigger(.walkthrough)
            })
            .disposed(by: disposeBag)

        return Output(isLoading: activityIndicator.asDriver())
    }
}
