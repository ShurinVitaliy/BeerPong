//
//  StartGameViewModel.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol StartGameViewModel {
    
}

class StartGameViewModelImp: StartGameViewModel {
    private let router: StartGameViewRouter
    let game: Game
    
    init(router: StartGameViewRouter, game: Game) {
        self.router = router
        self.game = game
    }
}
