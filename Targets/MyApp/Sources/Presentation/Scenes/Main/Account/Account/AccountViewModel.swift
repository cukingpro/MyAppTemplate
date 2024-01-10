import RxCocoa
import XCoordinator

class AccountViewModel: ViewModelType {
    private let router: UnownedRouter<AccountRoute>
    
    init(router: UnownedRouter<AccountRoute>) {
        self.router = router
    }
}

extension AccountViewModel {
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
