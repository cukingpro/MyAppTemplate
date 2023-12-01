import XCoordinator
import RxCocoa

final class CompleteYourProfileViewModel: ViewModelType {
    private let router: UnownedRouter<SignUpRoute>
    
    init(router: UnownedRouter<SignUpRoute>) {
        self.router = router
    }
}

extension CompleteYourProfileViewModel {
    struct Input {
        let skipTrigger: Driver<Void>
        let continueTrigger: Driver<Void>
    }

    struct Output {}

    func transform(_ input: Input) -> Output {
        return Output()
    }
}
