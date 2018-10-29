//
//  StartGameViewModel.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol StartGameViewModel {
    var gameCompetitions: [Competiton] { get }
}

class StartGameViewModelImp: StartGameViewModel {
    private let router: StartGameViewRouter
    let game: Game
    var gameCompetitions = [Competiton]()
    
    init(router: StartGameViewRouter, game: Game) {
        self.router = router
        self.game = game
        createPlace()
    }
    
    func addCompetition(competition: Competiton) {
        gameCompetitions.append(competition)
    }
    
    func createPlace() {
        var i: Int = 0
        while self.gameCompetitions.count != (self.game.countOfTeams()/2 + self.game.countOfTeams() % 2) {
            addCompetition(competition: Competiton(competiter1: game.teamForIndex(i), competiter2:  game.teamForIndex(i + 1)))
            i = i + 2
            print("wtf")
        }
    }
}
