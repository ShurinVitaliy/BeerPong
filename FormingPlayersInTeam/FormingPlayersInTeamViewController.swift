//
//  FormingPlayersInTeamViewController.swift
//  BeerPong
//
//  Created by Admin on 27.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class FormingPlayersInTeamViewController: UIViewController {
    private var viewModel: FormingPlayersInTeamViewModel?
    
    convenience init(viewModel: FormingPlayersInTeamViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
