//
//  TeamFormingViewModel.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol TeamFormingViewModel {
    func addNewItem(_ reloadData: @escaping () -> Void)
    func createTeam(name: String, captain: String)
    func didSelectRowAt(index: Int)
    func startGame()
    var game: Game { get }
    func setForIndex(_ index: Int) -> TeamForimingCellViewModelImp
}

class TeamFormingViewModelImp: TeamFormingViewModel {

    private var reloadData: (() -> Void)?
    private let router: TeamFormingViewRouter
    private let alertTitle: String = "создание команды"
    private let placeholderCaptain: String = "капитан команды"
    private let placeholderName: String = "название команды"
    //let game = Game(teams: [Team]())
    let game: Game
    
    init(router: TeamFormingViewRouter, game: Game) {
        self.router = router
        self.game = game
    }
    
    func addNewItem(_ reloadData: @escaping () -> Void) {
        self.reloadData = reloadData
        router.addNewItem(title: alertTitle, placeholderCaptain: placeholderCaptain, placeholderName: placeholderName, createTeam: createTeam)
    }
    
    func createTeam(name: String, captain: String) {
        let team = Team(name: name, captain: captain, victories: 0)
        game.addNewTeam(team: team)
        guard let reloadData = reloadData else {
            return }
        reloadData()
    }
    func didSelectRowAt(index: Int) {
        if let reloadData = reloadData {
            router.formingPlayersOfTeam(team: game.teamForIndex(index), reloadData: reloadData)
        } else {
            print("reloadData")
        }
        
    }
    
    func startGame() {
        if  game.countOfTeams() > 1 {
            router.startGame(game: game)
        } else {
            router.errorAlert(title: "недостаточное колличество команд", message: "создайте больше команд", titleButton: "OK")
        }
    }
    
    func setForIndex(_ index: Int) -> TeamForimingCellViewModelImp {
        return TeamForimingCellViewModelImp(team: game.teamForIndex(index))
    }
    
}
