//
//  FormingPlayersInTeamViewControllerAssembly.swift
//  BeerPong
//
//  Created by Admin on 27.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class FormingPlayersInTeamViewControllerAssembly {
    func createController(navigationController: UINavigationController, team: Team, reloadData: @escaping () -> Void) -> UIViewController {
        let router = FormingPlayersInTeamViewRouter(navigationController: navigationController)
        let model = FormingPlayersInTeamViewModelImp(router: router, team: team, reloadData: reloadData)
        let controller = FormingPlayersInTeamViewController(viewModel: model)
        return controller
    }
}
