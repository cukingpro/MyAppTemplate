import XCoordinator
import UIKit

enum SignUpRoute: Route {
    case signUp
    case completeYourProfile
}

class SignUpCoordinator: NavigationCoordinator<SignUpRoute> {

    override func prepareTransition(for route: SignUpRoute) -> NavigationTransition {
        switch route {
        case .signUp:
            let viewModel = SignUpViewModel(router: unownedRouter)
            let viewController = SignUpViewController(viewModel: viewModel)
            return .push(viewController)
            
        case .completeYourProfile:
            return .none()
        }
    }
}
