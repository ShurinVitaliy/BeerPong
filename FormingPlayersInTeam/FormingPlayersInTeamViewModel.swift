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
    private let placeholder: String = "член команды"
    let team: Team
    private var reloadDataInTeamForming: () -> Void
    
    
    init(router: FormingPlayersInTeamViewRouter, team: Team, reloadData: @escaping () -> Void) {
        self.router = router
        self.team = team
        self.reloadDataInTeamForming = reloadData
    }
    
    func addNewPlayer(_ reloadData: @escaping () -> Void) {
        self.reloadData = reloadData
        router.addPeople(title: alertTitle, placeholder: placeholder, addNewPeople: addNewPeople)
        
    }
    
    func addNewPeople(name: String) {
        team.addNewPlayerInTeam(name: name)
        guard let reloadData = reloadData else {
            return }
        reloadData()
        reloadDataInTeamForming()
    }
    
}
