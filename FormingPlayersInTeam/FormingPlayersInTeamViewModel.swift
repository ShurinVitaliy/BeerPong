//
//  FormingPlayersInTeamViewModel.swift
//  BeerPong
//
//  Created by Admin on 27.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol FormingPlayersInTeamViewModel {
    
}

class FormingPlayersInTeamViewModelImp: FormingPlayersInTeamViewModel {
    private let router: FormingPlayersInTeamViewRouter
    let team: Team
    init(router: FormingPlayersInTeamViewRouter, team: Team) {
        self.router = router
        self.team = team
    }
}
