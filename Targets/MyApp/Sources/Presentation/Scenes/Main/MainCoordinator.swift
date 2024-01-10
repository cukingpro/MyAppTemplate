//
//  MainCoordinator.swift
//  MyApp
//
//  Created by HuyTNH on 06/12/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import UIKit
import XCoordinator

enum MainRoute: Route {
    case chat
    case aiAssistants
    case history
    case account
}

class MainCoordinator: TabBarCoordinator<MainRoute> {
    private let chatRouter: StrongRouter<ChatRoute>
    private let assistantsRouter: StrongRouter<AssistantsRoute>
    private let historyRouter: StrongRouter<HistoryRoute>
    private let accountRouter: StrongRouter<AccountRoute>

    convenience init() {
        let chatRouter = ChatCoordinator(rootViewController: BaseNavigationController())
        chatRouter.rootViewController.tabBarItem = UITabBarItem(title: MyAppStrings.tabbarChat,
                                                                image: MyAppAsset.Images.chatIcon.image,
                                                                tag: 0)

        let assistantsRouter = AssistantsCoordinator(rootViewController: BaseNavigationController())
        assistantsRouter.rootViewController.tabBarItem = UITabBarItem(title: MyAppStrings.tabbarAssistants,
                                                                      image: MyAppAsset.Images.categoryIcon.image,
                                                                      tag: 1)

        let historyRouter = HistoryCoordinator(rootViewController: BaseNavigationController())
        historyRouter.rootViewController.tabBarItem = UITabBarItem(title: MyAppStrings.tabbarHistory,
                                                                   image: MyAppAsset.Images.historyIcon.image,
                                                                   tag: 2)

        let accountRouter = AccountCoordinator(rootViewController: BaseNavigationController())
        accountRouter.rootViewController.tabBarItem = UITabBarItem(title: MyAppStrings.tabbarAccount,
                                                                   image: MyAppAsset.Images.profileIcon.image,
                                                                   tag: 3)

        self.init(chatRouter: chatRouter.strongRouter,
                  assistantsRouter: assistantsRouter.strongRouter,
                  historyRouter: historyRouter.strongRouter,
                  accountRouter: accountRouter.strongRouter)
    }

    init(chatRouter: StrongRouter<ChatRoute>,
         assistantsRouter: StrongRouter<AssistantsRoute>,
         historyRouter: StrongRouter<HistoryRoute>,
         accountRouter: StrongRouter<AccountRoute>) {
        self.chatRouter = chatRouter
        self.assistantsRouter = assistantsRouter
        self.historyRouter = historyRouter
        self.accountRouter = accountRouter
        super.init(rootViewController: BaseTabBarController(),
                   tabs: [chatRouter, assistantsRouter, historyRouter, accountRouter],
                   select: accountRouter)
    }

    override func prepareTransition(for route: MainRoute) -> TabBarTransition {
        switch route {
        case .chat:
            return .select(chatRouter)
        case .aiAssistants:
            return .select(assistantsRouter)
        case .history:
            return .select(historyRouter)
        case .account:
            return .select(accountRouter)
        }
    }
}
