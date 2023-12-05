import RxCocoa
import XCoordinator

class SignInViewModel: ViewModelType {
    private let router: UnownedRouter<SignInRoute>

    init(router: UnownedRouter<SignInRoute>) {
        self.router = router
    }
}

extension SignInViewModel {
    struct Input {
        let forgotPasswordTrigger: Driver<Void>
        let signUpTrigger: Driver<Void>
        let loginTrigger: Driver<Void>
    }

    struct Output {}

    func transform(_ input: Input) -> Output {
        input.forgotPasswordTrigger.drive(onNext: {
            self.router.trigger(.resetPassword)
        }).disposed(by: disposeBag)

        input.signUpTrigger.drive(onNext: {
            self.router.trigger(.signUp)
        }).disposed(by: disposeBag)

        input.loginTrigger.drive(onNext: {}).disposed(by: disposeBag)

        return Output()
    }
}
