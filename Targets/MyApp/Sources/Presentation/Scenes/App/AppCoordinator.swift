//
//  AppCoordinator.swift
//  MyApp
//
//  Created by HuyTNH on 06/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import XCoordinator

enum AppRoute: Route {
    case splash
    case walkthrough
    case welcome
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    init() {
        super.init(initialRoute: .splash)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .splash:
            let viewModel = SplashViewModel(router: unownedRouter)
            let viewController = SplashViewController(viewModel: viewModel)
            return .push(viewController)
            
        case .walkthrough:
            let viewModel = WalkthroughViewModel(router: unownedRouter)
            let viewController = WalkthroughViewController(viewModel: viewModel)
            return .set([viewController])
            
        case .welcome:
            let viewModel = WelcomeViewModel(router: unownedRouter)
            let viewController = WelcomeViewController(viewModel: viewModel)
            return .set([viewController])
        }
    }
}
