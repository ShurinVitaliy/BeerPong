//
//  CardViewModel.swift
//  BeerPong
//
//  Created by Admin on 05.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol CardViewModel {
    var nameOfTeam: String { get }
}

class CardViewModelImp: CardViewModel {
    let nameOfTeam: String
    
    init(nameOfTeam: String) {
        self.nameOfTeam = nameOfTeam
    }
}
