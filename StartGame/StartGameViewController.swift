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
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(nextLvL))
    }
    
    @objc private func nextLvL(_ sender: UIBarButtonItem) {
        print("nex")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StartGameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.competitions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let model = StartGameCellViewController(viewModel: StartGameCellViewModelImp(competitions: (viewModel?.competitions[indexPath.row])!) )
        cell.addSubview(model)
        model.translatesAutoresizingMaskIntoConstraints = false
        model.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        model.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        model.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        model.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        return cell
    }
}

extension StartGameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectRowAt(index: indexPath.row, { [weak self] in
            self?.tableView.reloadData()
        })
    }
}
