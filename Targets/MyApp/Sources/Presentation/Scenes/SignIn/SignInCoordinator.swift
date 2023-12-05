import XCoordinator
import UIKit

enum SignInRoute: Route {
    case signIn
    case resetPassword
    case otpCodeVerification
    case createNewPassword
    case signUp
}

final class SignInCoordinator: NavigationCoordinator<SignInRoute> {
    let parent: UnownedRouter<AppRoute>

    init(rootViewController: UINavigationController, parent: UnownedRouter<AppRoute>) {
        self.parent = parent
        super.init(rootViewController: rootViewController)
    }
    
    override func prepareTransition(for route: SignInRoute) -> NavigationTransition {
        switch route {
        case .signIn:
            let viewModel = SignInViewModel(router: unownedRouter)
            let viewController = SignInViewController(viewModel: viewModel)
            return .push(viewController)
        case .resetPassword:
            let viewModel = ResetPasswordViewModel(router: unownedRouter)
            let viewController = ResetPasswordViewController(viewModel: viewModel)
            return .push(viewController)
        case .otpCodeVerification:
            return .none()
        case .createNewPassword:
            return .none()
        case .signUp:
            return .multiple([
                .pop(),
                .trigger(AppRoute.signUp, on: parent),
            ])
        }
    }
}
