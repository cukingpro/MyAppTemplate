import RxCocoa
import XCoordinator

class AssistantsViewModel: ViewModelType {
    private let router: UnownedRouter<AssistantsRoute>
    
    init(router: UnownedRouter<AssistantsRoute>) {
        self.router = router
    }
}

extension AssistantsViewModel {
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
