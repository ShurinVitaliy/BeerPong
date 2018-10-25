//
//  TeamFormingViewModel.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol TeamFormingViewModel {
    
}

class TeamFormingViewModelImp: TeamFormingViewModel {
    private let router: TeamFormingViewRouter
    init(router: TeamFormingViewRouter) {
        self.router = router
    }
}
