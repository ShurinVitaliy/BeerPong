//
//  StartGameViewRouter.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData

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
    
    func back(winer: String) {
        let alert = UIAlertController(title: "конец игры", message: winer, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "HistoryOfWiners", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        item.setValue(winer, forKey: "teamName")
        
        do {
            try managedContext.save()
        } catch let err as NSError {
            print("error save", err)
        }
    }
}
