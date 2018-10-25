//
//  Teams.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Team {
    private(set) var name: String
    private(set) var captain: String
    private var players: [Player]?
    private var victories: Int = 0
    
    init(name: String, captain: String, players: [Player]?, victories: Int) {
        self.name = name
        self.captain = captain
        self.players = players
        self.victories = victories
    }
}
