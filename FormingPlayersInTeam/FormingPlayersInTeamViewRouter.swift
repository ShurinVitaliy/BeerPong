//
//  FormingPlayersInTeamViewRouter.swift
//  BeerPong
//
//  Created by Admin on 27.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class FormingPlayersInTeamViewRouter {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func addPeople(title: String, placeholder: String, addNewPeople: @escaping (String) -> Void) {
        let aler = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        aler.addTextField(configurationHandler: { (name) in
            name.placeholder = placeholder
        })
        aler.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        aler.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if (aler.textFields![0].text?.isEmpty)! {
                let alertWarning = UIAlertController(title: "Ошибка", message: "вы не ввели имя", preferredStyle: .alert)
                alertWarning.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.navigationController.present(alertWarning, animated: true, completion: nil)
            } else {
                addNewPeople(aler.textFields![0].text!)
            }
        }))
        navigationController.present(aler, animated: true, completion: nil)        
    }
}
