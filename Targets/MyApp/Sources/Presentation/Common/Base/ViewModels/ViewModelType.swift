//
//  ViewModelType.swift
//  MyApp
//
//  Created by HuyTNH on 07/11/2023.
//  Copyright © 2023 com.thehuytong. All rights reserved.
//

import Foundation
import NSObject_Rx

protocol ViewModelType: AnyObject, HasDisposeBag {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output
}
