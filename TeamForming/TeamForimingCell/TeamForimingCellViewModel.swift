//
//  TeamForimingCellViewModel.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol TeamForimingCellViewModel {
    var team: Team { get }
}

class TeamForimingCellViewModelImp: TeamForimingCellViewModel {
    let team: Team
    
    init(team: Team) {
        self.team = team
    }
    
}
