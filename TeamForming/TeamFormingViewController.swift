//
//  TeamFormingViewController.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TeamFormingViewController: UIViewController {
    private var viewModel: TeamFormingViewModel?
    private var tableView: UITableView!
    
    convenience init(viewModel: TeamFormingViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = createTableView()
        view.addSubview(tableView)
        setupNavigationBar()
        
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTeam))
    }
    
    @objc private func addTeam(_ sender: UIBarButtonItem) {
        viewModel?.addNewItem({ [weak self] in
            self?.tableView.reloadData()
            print("i here")
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TeamFormingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.game.countOfTeams() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let model = TeamForimingCellViewController(viewModel: TeamForimingCellViewModelImp(team: (viewModel?.game.teamForIndex(indexPath.row))!))
        model.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(model)
        
        return cell
    }
}

extension TeamFormingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
