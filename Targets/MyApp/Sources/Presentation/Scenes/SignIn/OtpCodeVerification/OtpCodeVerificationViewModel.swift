import RxCocoa
import XCoordinator

class OtpCodeVerificationViewModel: ViewModelType {
    private let router: UnownedRouter<SignInRoute>
    
    init(router: UnownedRouter<SignInRoute>) {
        self.router = router
    }
}

extension OtpCodeVerificationViewModel {
    struct Input {
        let trigger: Driver<Void>
    }

    struct Output {
        let trigger: Driver<Void>
    }

    func transform(_ input: Input) -> Output {
        return Output(trigger: Driver.just(()))
    }
}
