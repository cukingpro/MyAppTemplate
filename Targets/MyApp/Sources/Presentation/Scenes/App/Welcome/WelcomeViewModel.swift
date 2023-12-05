import RxCocoa
import XCoordinator

final class WelcomeViewModel: ViewModelType {
    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
}

extension WelcomeViewModel {
    struct Input {
        let signInTrigger: Driver<Void>
        let signUpTrigger: Driver<Void>
        let googleTrigger: Driver<Void>
        let appleTrigger: Driver<Void>
        let facebookTrigger: Driver<Void>
    }

    struct Output {}

    func transform(_ input: Input) -> Output {
        input.signInTrigger.drive(onNext: {
            self.router.trigger(.signIn)
        })
        .disposed(by: disposeBag)

        input.signUpTrigger.drive(onNext: {
            self.router.trigger(.signUp)
        })
        .disposed(by: disposeBag)

        return Output()
    }
}
