//
//  Competition.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Competiton {
    private(set) var competiter1: Team
    private(set) var competiter2: Team
    private var viner: Team?
    
    init(competiter1: Team, competiter2: Team) {
        self.competiter1 = competiter1
        self.competiter2 = competiter2
    }
    
    func setupViner(team: Team) {
        viner = team
    }
    
    func getViner() -> Team {
        return viner!
    }
    
    func nameOfViner() -> String {
        return "победитель: \(viner?.name ?? " ")"
    }
    
    func vinerIsNil() -> Bool {
        if self.viner != nil {
            return true
        } else {
            return false
        }
    }
}
