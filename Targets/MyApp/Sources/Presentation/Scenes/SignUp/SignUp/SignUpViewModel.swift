import XCoordinator
import RxCocoa

class SignUpViewModel: ViewModelType {
    private let router: UnownedRouter<SignUpRoute>
    
    init(router: UnownedRouter<SignUpRoute>) {
        self.router = router
    }
}

extension SignUpViewModel {
    struct Input {
        let logInTrigger: Driver<Void>
        let continueTrigger: Driver<Void>
    }

    struct Output {}

    func transform(_ input: Input) -> Output {
        input.continueTrigger.drive(onNext: {
            self.router.trigger(.completeYourProfile)
        })
        .disposed(by: disposeBag)
        
        input.logInTrigger.drive(onNext: {
            self.router.trigger(.signIn)
        })
        .disposed(by: disposeBag)
        
        return Output()
    }
}
