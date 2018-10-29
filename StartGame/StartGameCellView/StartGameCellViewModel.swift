//
//  StartGameCellViewModel.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol StartGameCellViewModel {
    var competitions: Competiton{ get }
}

class StartGameCellViewModelImp: StartGameCellViewModel {
    let competitions: Competiton
    
    init(competitions: Competiton) {
        self.competitions = competitions
    }
}
