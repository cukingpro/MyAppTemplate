//
//  SplashViewModel.swift
//  MyApp
//
//  Created by HuyTNH on 06/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import Foundation
import XCoordinator

class SplashViewModel: ViewModelType {
    let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
}
