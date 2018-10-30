//
//  StartGameViewRouter.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class StartGameViewRouter {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func whyIsWiner(competition1: Team, competition2: Team, index: Int, createWiner: @escaping (Team, Int) -> Void) {
        let alert = UIAlertController(title: "Победитель", message: "выберите команду которая одержала победу", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: competition1.name, style: .default, handler: { (action) in
            createWiner(competition1, index)
        }))
        alert.addAction(UIAlertAction(title: competition2.name, style: .default, handler: { (action) in
            createWiner(competition2, index)
        }))
        navigationController.present(alert, animated: true, completion: nil)
    }
    
}
