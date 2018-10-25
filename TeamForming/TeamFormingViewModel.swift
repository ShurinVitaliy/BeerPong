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
    var game: Game { get }
}

class TeamFormingViewModelImp: TeamFormingViewModel {

    private var reloadData: (() -> Void)?
    private let router: TeamFormingViewRouter
    private let alertTitle: String = "создание команды"
    private let placeholderCaptain: String = "капитан команды"
    private let placeholderName: String = "название команды"
    let game = Game(teams: [Team]())
    
    init(router: TeamFormingViewRouter) {
        self.router = router
    }
    
    func addNewItem(_ reloadData: @escaping () -> Void) {
        self.reloadData = reloadData
        router.addNewItem(title: alertTitle, placeholderCaptain: placeholderCaptain, placeholderName: placeholderName, createTeam: createTeam)
    }
    
    func createTeam(name: String, captain: String) {
        let team = Team(name: name, captain: captain, players: nil, victories: 0)
        game.addNewTeam(team: team)
        guard let reloadData = reloadData else {
            print("lol")
            return }
        reloadData()
    }
    
}
