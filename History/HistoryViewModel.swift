//
//  HistoryViewModel.swift
//  BeerPong
//
//  Created by Admin on 02.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol HistoryViewModel {
    
}

class HistoryViewModelImp: HistoryViewModel {
    
    let router: HistoryViewRouter
    
    init(router: HistoryViewRouter) {
        self.router = router
    }
    
}
