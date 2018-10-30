//
//  StartGameViewControllerAssembly.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class StartGameViewControllerAssembly {
    func createController(navigationController: UINavigationController, game: Game, competitions: [Competiton]) -> UIViewController {
        let router = StartGameViewRouter(navigationController: navigationController)
        let model = StartGameViewModelImp(router: router, game: game, competitions: competitions)
        let controller = StartGameViewController(viewModel: model)
        return controller
    }
}
