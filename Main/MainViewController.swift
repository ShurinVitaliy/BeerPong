//
//  MainViewController.swift
//  BeerPong
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

enum ButtonType {
    case startGameButton
    case teamFormingButton
    
    func title() -> String {
        switch self {
        case .startGameButton:
            return "Играть"
        case .teamFormingButton:
            return "формировать команду"
        }
    }
}

class MainViewController: UIViewController {
    private var viewModel: MainViewModel?
    private var startGameButton: UIButton!
    private var teamFormingButton: UIButton!
    private var stage: UIView!
    
    convenience init(viewModel: MainViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startGameButton = setupButton(buttonType: ButtonType.startGameButton)
        view.addSubview(startGameButton)
        teamFormingButton = setupButton(buttonType: ButtonType.teamFormingButton)
        view.addSubview(teamFormingButton)
        setupConstraints()
    }
    
    private func setupButton(buttonType: ButtonType) -> UIButton {
        let button = UIButton()
        button.setTitle(buttonType.title(), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        switch buttonType {
        case .startGameButton: button.addTarget(self, action: #selector(startGame), for: UIControlEvents.touchUpInside)
            button.backgroundColor = .darkGray
            button.setTitleColor(.white, for: .normal)
        case .teamFormingButton: button.addTarget(self, action: #selector(teamForming), for: UIControlEvents.touchUpInside)
            button.backgroundColor = .white
            button.setTitleColor(.darkGray, for: .normal)
        }
        return button
    }
    
    @objc private func startGame(_ sender: UIButton) {
        
    }
    
    @objc private func teamForming(_ sender: UIButton) {
        viewModel?.teamForming()
    }
    
    private func setupConstraints() {
        teamFormingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        teamFormingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        teamFormingButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        teamFormingButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
        startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        startGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        startGameButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
