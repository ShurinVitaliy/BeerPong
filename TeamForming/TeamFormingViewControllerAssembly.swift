//
//  TeamFormingViewControllerAssembly.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TeamFormingViewControllerAssembly {
    func createController(navigationController: UINavigationController, game: Game, competitions: [Competiton]) -> UIViewController {
        let router = TeamFormingViewRouter(navigationController: navigationController, competitions: competitions)
        let model = TeamFormingViewModelImp(router: router, game: game)
        let controller = TeamFormingViewController(viewModel: model)
        return controller
    }
}
