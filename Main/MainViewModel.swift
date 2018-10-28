//
//  MainViewModel.swift
//  BeerPong
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol MainViewModel {
    func teamForming()
    var game: Game {get}
}

class MainViewModelImp: MainViewModel {

    private let router: MainViewRouter
    let game = Game(teams: [Team]())
    
    init(router: MainViewRouter) {
        self.router = router
    }
    
    func teamForming() {
        router.openTeamForming(game: game)
    }
}
