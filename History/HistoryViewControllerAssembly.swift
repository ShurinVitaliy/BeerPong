//
//  HistoryViewControllerAssembly.swift
//  BeerPong
//
//  Created by Admin on 02.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class HistoryViewControllerAssembly {
    func createController(navigationController: UINavigationController) -> UIViewController {
        let router = HistoryViewRouter(navigationController: navigationController)
        let model = HistoryViewModelImp(router: router)
        let controller = HistoryViewController()
        return controller
    }
}
