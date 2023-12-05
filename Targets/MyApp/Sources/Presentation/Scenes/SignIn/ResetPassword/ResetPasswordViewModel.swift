import RxCocoa
import XCoordinator

class ResetPasswordViewModel: ViewModelType {
    private let router: UnownedRouter<SignInRoute>
    
    init(router: UnownedRouter<SignInRoute>) {
        self.router = router
    }
}

extension ResetPasswordViewModel {
    struct Input {
        let continueTrigger: Driver<Void>
    }

    struct Output {
        let trigger: Driver<Void>
    }

    func transform(_ input: Input) -> Output {
        input.continueTrigger.drive(onNext: {
            self.router.trigger(.otpCodeVerification)
        })
        .disposed(by: disposeBag)
        
        return Output(trigger: Driver.just(()))
    }
}
