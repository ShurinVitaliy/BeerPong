//
//  MainViewControllerAssembly.swift
//  BeerPong
//
//  Created by Admin on 23.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MainViewControllerAssembly {
    func createController() -> UIViewController {
        let controller = UINavigationController()
        let router = MainViewRouter(navigationController: controller)
        let model = MainViewModelImp(router: router)
        controller.viewControllers = [MainViewController(viewModel: model)]
        return controller
    }
}
