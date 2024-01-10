import XCoordinator

enum AssistantsRoute: Route {
    case root
}

class AssistantsCoordinator: NavigationCoordinator<AssistantsRoute> {
    init(rootViewController: BaseNavigationController) {
        super.init(rootViewController: rootViewController)
        trigger(.root)
    }

    override func prepareTransition(for route: AssistantsRoute) -> NavigationTransition {
        switch route {
        case .root:
            return .none()
        }
    }
}
