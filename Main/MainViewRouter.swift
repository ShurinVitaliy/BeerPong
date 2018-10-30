//
//  MainViewRouter.swift
//  BeerPong
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MainViewRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func openTeamForming(game: Game, competitions: [Competiton]) {
        let assembly = TeamFormingViewControllerAssembly()
        let controller = assembly.createController(navigationController: navigationController, game: game, competitions: competitions)
        navigationController.pushViewController(controller, animated: true)
    }
}
