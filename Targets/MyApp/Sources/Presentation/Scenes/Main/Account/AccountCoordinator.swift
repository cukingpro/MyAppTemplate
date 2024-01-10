import XCoordinator
import UIKit

enum AccountRoute: Route {
    case account
}

class AccountCoordinator: NavigationCoordinator<AccountRoute> {
    init(rootViewController: BaseNavigationController) {
        super.init(rootViewController: rootViewController)
        trigger(.account)
    }

    override func prepareTransition(for route: AccountRoute) -> NavigationTransition {
        switch route {
        case .account:
            let viewModel = AccountViewModel(router: unownedRouter)
            let viewController = AccountViewController(viewModel: viewModel)
            return .push(viewController)
        }
    }
}
