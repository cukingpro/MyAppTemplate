import UIKit
import XCoordinator

enum SignUpRoute: Route {
    case signUp
    case completeYourProfile
    case signIn
}

final class SignUpCoordinator: NavigationCoordinator<SignUpRoute> {
    let parent: UnownedRouter<AppRoute>

    init(rootViewController: UINavigationController, parent: UnownedRouter<AppRoute>) {
        self.parent = parent
        super.init(rootViewController: rootViewController)
    }

    override func prepareTransition(for route: SignUpRoute) -> NavigationTransition {
        switch route {
        case .signUp:
            let viewModel = SignUpViewModel(router: unownedRouter)
            let viewController = SignUpViewController(viewModel: viewModel)
            return .push(viewController)

        case .completeYourProfile:
            let viewModel = CompleteYourProfileViewModel(router: unownedRouter)
            let viewController = CompleteYourProfileViewController(viewModel: viewModel)
            return .push(viewController)

        case .signIn:
            return .multiple([
                .pop(),
                .trigger(AppRoute.signIn, on: parent),
            ])
        }
    }
}
