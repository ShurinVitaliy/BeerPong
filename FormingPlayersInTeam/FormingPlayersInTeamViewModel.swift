//
//  FormingPlayersInTeamViewModel.swift
//  BeerPong
//
//  Created by Admin on 27.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol FormingPlayersInTeamViewModel {
    func addNewPlayer(_ reloadData: @escaping () -> Void)
    var team: Team { get }
}

class FormingPlayersInTeamViewModelImp: FormingPlayersInTeamViewModel {

    private var reloadData: (() -> Void)?
    private let router: FormingPlayersInTeamViewRouter
    private let alertTitle: String = "создание команды"
    private let placeholder: String = "капитан команды"
    let team: Team
    
    
    init(router: FormingPlayersInTeamViewRouter, team: Team) {
        self.router = router
        self.team = team
    }
    
    func addNewPlayer(_ reloadData: @escaping () -> Void) {
        self.reloadData = reloadData
        router.addPeople(title: alertTitle, placeholder: placeholder, addNewPeople: addNewPeople)
    }
    
    func addNewPeople(name: String) {
        
    }
    
}
