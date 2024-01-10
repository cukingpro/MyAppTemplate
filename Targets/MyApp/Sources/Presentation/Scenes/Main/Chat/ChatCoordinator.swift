import XCoordinator

enum ChatRoute: Route {
    case root
}

class ChatCoordinator: NavigationCoordinator<ChatRoute> {
    init(rootViewController: BaseNavigationController) {
        super.init(rootViewController: rootViewController)
        trigger(.root)
    }

    override func prepareTransition(for route: ChatRoute) -> NavigationTransition {
        switch route {
        case .root:
            return .none()
        }
    }
}
