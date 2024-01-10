import RxCocoa
import XCoordinator

class ChatViewModel: ViewModelType {
    private let router: UnownedRouter<ChatRoute>
    
    init(router: UnownedRouter<ChatRoute>) {
        self.router = router
    }
}

extension ChatViewModel {
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
