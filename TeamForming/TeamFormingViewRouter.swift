//
//  TeamFormingViewRouter.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TeamFormingViewRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func formingPlayersOfTeam(team: Team) {
        let assembly = FormingPlayersInTeamViewControllerAssembly()
        let controller = assembly.createController(navigationController: navigationController, team: team)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func addNewItem(title: String, placeholderCaptain: String, placeholderName: String, createTeam: @escaping (String, String) -> Void) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (name) in
            name.placeholder = placeholderName
        })
        alert.addTextField(configurationHandler: { (captain) in
            captain.placeholder = placeholderCaptain
        })
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (action) in
            createTeam("тут нужна логика", "и тут нужна логика")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        navigationController.present(alert, animated: true, completion: nil)
    }
}
