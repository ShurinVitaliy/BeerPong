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
    func createTeam(name: String, captain: String) -> Void
    func didSelectRowAt(index: Int)
    var game: Game { get }
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
        router.formingPlayersOfTeam(team: game.teamForIndex(index), reloadData: reloadData!)
    }
    
}
