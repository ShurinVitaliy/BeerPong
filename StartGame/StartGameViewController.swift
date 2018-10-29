//
//  StartGameViewController.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {
    
    private var viewModel: StartGameViewModel?
    private var tableView: UITableView!
    
    convenience init(viewModel: StartGameViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: view.bounds)
        
        return tableView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
