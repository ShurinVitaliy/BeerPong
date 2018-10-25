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
}

class MainViewModelImp: MainViewModel {

    private let router: MainViewRouter
    init(router: MainViewRouter) {
        self.router = router
    }
    
    func teamForming() {
        router.openTeamForming()
    }
}
