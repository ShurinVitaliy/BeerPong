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
    func didSelectRowAt(index: Int, _ reloadData: @escaping () -> Void)
    func createWiner(winer: Team, index: Int)
    func nextGameOrFinal()
    func setForIndex(_ index: Int) -> StartGameCellViewModelImp
}

class StartGameViewModelImp: StartGameViewModel {
    
    private let router: StartGameViewRouter
    let game: Game
    var gameCompetitions = [Competiton]()
    private var reloadData: (() -> Void)?
    
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
        if (game.countOfTeams() % 2) == 1 {
            while self.gameCompetitions.count != (self.game.countOfTeams()/2 + self.game.countOfTeams() % 2) {
                addCompetition(competition: Competiton(competiter1: game.teamForIndex(i), competiter2:  game.teamForIndex(i + 1)))
                i = i + 1
            }
        } else {
            while self.gameCompetitions.count != (self.game.countOfTeams()/2 + self.game.countOfTeams() % 2) {
                addCompetition(competition: Competiton(competiter1: game.teamForIndex(i), competiter2:  game.teamForIndex(i + 1)))
                i = i + 2
            }
        }
        
    }
    
    func didSelectRowAt(index: Int, _ reloadData: @escaping () -> Void) {
        self.reloadData = reloadData
        router.whyIsWiner(competition1: gameCompetitions[index].competiter1, competition2: gameCompetitions[index].competiter2, index: index, createWiner: createWiner)
    }
    
    func createWiner(winer: Team, index: Int) {
        gameCompetitions[index].setupViner(team: winer)
        guard let reloadData = reloadData else {
            return }
        reloadData()
    }
    
    func nextGameOrFinal() {
        if gameCompetitions.count > 1 {
            var index: Int = 0
            var bufferGameCompetitions = [Competiton]()
            while bufferGameCompetitions.count != (gameCompetitions.count / 2 + gameCompetitions.count % 2) {
                bufferGameCompetitions.append(Competiton(competiter1: gameCompetitions[index].getViner(), competiter2:  gameCompetitions[index + 1].getViner()))
                index = index + 1
            }
            self.gameCompetitions = bufferGameCompetitions
            guard let reloadData = reloadData else {
                return }
            reloadData()
        } else {
            router.back(winer: gameCompetitions[0].nameOfViner())
        }
    }
    
    func setForIndex(_ index: Int) -> StartGameCellViewModelImp {
        return StartGameCellViewModelImp(competitions: gameCompetitions[index])
    }

}
