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
    private var viewForTableView: UIView!
    private var startGameButton: UIButton!
    
    convenience init(viewModel: TeamFormingViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLay")
        setUpConstraints()
        setUpConstraintsForTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        viewForTableView = createViewForTableView()
        view.addSubview(viewForTableView)
        startGameButton = createStartGameButton()
        view.addSubview(startGameButton)
        tableView = createTableView()
        viewForTableView.addSubview(tableView)
        setupNavigationBar()
    }
    
    private func createStartGameButton() -> UIButton {
        let gameButton = UIButton()
        gameButton.setTitle("Перейти к игре!", for: .normal)
        gameButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        gameButton.titleLabel?.textAlignment = .center
        gameButton.translatesAutoresizingMaskIntoConstraints = false
        gameButton.addTarget(self, action: #selector(startGame), for: UIControlEvents.touchUpInside)
        gameButton.backgroundColor = .darkGray
        return gameButton
    }
    
    @objc private func startGame(_ sender: UIButton) {
        viewModel?.startGame()
    }
    
    private func createViewForTableView() -> UIView {
        let viewForTableView = UIView()
        viewForTableView.backgroundColor = .white
        viewForTableView.translatesAutoresizingMaskIntoConstraints = false
        return viewForTableView
    }
    
    private func setUpConstraints() {
        
        viewForTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewForTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewForTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewForTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 8/9).isActive = true
        
        startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        startGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        startGameButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/9).isActive = true
        
    }
    
    private func setUpConstraintsForTableView() {
        tableView.trailingAnchor.constraint(equalTo: viewForTableView.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: viewForTableView.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: viewForTableView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: viewForTableView.bottomAnchor).isActive = true
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: viewForTableView.bounds)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TeamForimingCellViewController.self, forCellReuseIdentifier: "TeamForimingCellViewController")
        return tableView
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTeam))
    }
    
    @objc private func addTeam(_ sender: UIBarButtonItem) {
        viewModel?.addNewItem({ [weak self] in
            self?.tableView.reloadData()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamForimingCellViewController", for: indexPath) as? TeamForimingCellViewController, let model = viewModel?.setForIndex(indexPath.row)
            else {
            return UITableViewCell()
        }
        
        cell.apply(viewModel: model)
        return cell
    }
}

extension TeamFormingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectRowAt(index: indexPath.row)
    }
}
