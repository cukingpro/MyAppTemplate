import RxCocoa
import XCoordinator

class HistoryViewModel: ViewModelType {
    private let router: UnownedRouter<HistoryRoute>
    
    init(router: UnownedRouter<HistoryRoute>) {
        self.router = router
    }
}

extension HistoryViewModel {
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
