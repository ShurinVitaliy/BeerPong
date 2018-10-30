//
//  StartGameViewModel.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol StartGameViewModel {
    var competitions: [Competiton] { get }
    func didSelectRowAt(index: Int, _ reloadData: @escaping () -> Void)
    func createWiner(winer: Team, index: Int)
}

class StartGameViewModelImp: StartGameViewModel {
    
    private let router: StartGameViewRouter
    let game: Game
    var competitions: [Competiton]
    private var reloadData: (() -> Void)?
    
    init(router: StartGameViewRouter, game: Game, competitions: [Competiton]) {
        self.router = router
        self.game = game
        self.competitions = competitions
        createPlace()
    }
    
    func addCompetition(competition: Competiton) {
        competitions.append(competition)
    }
    
    func createPlace() {
        var i: Int = 0
        while self.competitions.count != (self.game.countOfTeams()/2 + self.game.countOfTeams() % 2) {
            addCompetition(competition: Competiton(competiter1: game.teamForIndex(i), competiter2:  game.teamForIndex(i + 1)))
            i = i + 2
        }
    }
    
    func didSelectRowAt(index: Int, _ reloadData: @escaping () -> Void) {
        self.reloadData = reloadData
        router.whyIsWiner(competition1: competitions[index].competiter1, competition2: competitions[index].competiter2, index: index, createWiner: createWiner)
    }
    
    func createWiner(winer: Team, index: Int) {
        competitions[index].setupViner(team: winer)
        guard let reloadData = reloadData else {
            return }
        reloadData()
    }
    

}
