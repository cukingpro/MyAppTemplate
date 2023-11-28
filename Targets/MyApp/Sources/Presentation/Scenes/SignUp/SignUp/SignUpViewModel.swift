import XCoordinator

class SignUpViewModel: ViewModelType {
    private let router: UnownedRouter<SignUpRoute>
    
    init(router: UnownedRouter<SignUpRoute>) {
        self.router = router
    }
}

extension SignUpViewModel {
    struct Input {}

    struct Output {}

    func transform(_ input: Input) -> Output {
        return Output()
    }
}
