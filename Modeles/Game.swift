//
//  Game.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Play {
    private var tour: Int = 1
    private var teams: [Team]
    
    init(teams: [Team]) {
        self.teams = teams
    }
}
