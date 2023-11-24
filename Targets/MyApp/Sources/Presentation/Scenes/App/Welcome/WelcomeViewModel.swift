import XCoordinator
import RxCocoa

final class WelcomeViewModel: ViewModelType {
    private let router: UnownedRouter<AppRoute>
    
    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
}

extension WelcomeViewModel {
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
