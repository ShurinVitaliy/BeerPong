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
    var competitions: [Competiton]
    
    init(navigationController: UINavigationController, competitions: [Competiton]) {
        self.navigationController = navigationController
        self.competitions = competitions
    }
    
    func formingPlayersOfTeam(team: Team, reloadData: @escaping () -> Void) {
        let assembly = FormingPlayersInTeamViewControllerAssembly()
        let controller = assembly.createController(navigationController: navigationController, team: team, reloadData: reloadData)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func addNewItem(title: String, placeholderCaptain: String, placeholderName: String, createTeam: @escaping (String, String) -> Void) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        var flag = true
        alert.addTextField(configurationHandler: { (name) in
            name.placeholder = placeholderName
            name.textAlignment = .center
            name.borderStyle = .roundedRect
            name.backgroundColor = .white
        })
        alert.addTextField(configurationHandler: { (captain) in
            captain.placeholder = placeholderCaptain
            captain.textAlignment = .center
            captain.borderStyle = .roundedRect
            captain.backgroundColor = .white
        })
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (action) in
            for textField in alert.textFields! {
                if (textField.text?.isEmpty)! {
                    flag = false
                    self.errorAlert(title: "не все поля заполнены!", message: "заполните все поля!", titleButton: "Cancel")
                }
            }
            if flag {
                createTeam(alert.textFields![0].text!, alert.textFields![1].text!)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        navigationController.present(alert, animated: true, completion: nil)
    }
    
    func startGame(game: Game) {
        let assembly = StartGameViewControllerAssembly()
        let controller = assembly.createController(navigationController: navigationController, game: game, competitions: competitions)
        navigationController.pushViewController(controller, animated: true)
        
    }
    
    func errorAlert(title: String, message: String, titleButton: String) {
        let alerWarning = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alerWarning.addAction(UIAlertAction(title: titleButton, style: .cancel))
        navigationController.present(alerWarning, animated: true, completion: nil)
    }
    
    

}
