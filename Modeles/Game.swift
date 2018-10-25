//
//  Game.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Game {
    private var tour: Int = 1
    private var teams: [Team]
    
    init(teams: [Team]) {
        self.teams = teams
    }
    
    func teamForIndex(_ index: Int) -> Team {
        return teams[index]
    }
    
    func addNewTeam(team: Team) {
        teams.append(team)
    }
    
    func countOfTeams() -> Int {
        return teams.count
    }
}
