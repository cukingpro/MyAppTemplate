import XCoordinator

enum HistoryRoute: Route {
    case root
}

class HistoryCoordinator: NavigationCoordinator<HistoryRoute> {
    init(rootViewController: BaseNavigationController) {
        super.init(rootViewController: rootViewController)
        trigger(.root)
    }

    override func prepareTransition(for route: HistoryRoute) -> NavigationTransition {
        switch route {
        case .root:
            return .none()
        }
    }
}
