//
//  TeamForimingCellViewController.swift
//  BeerPong
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

enum LabelType {
    case name
    case captain
    case players
    
    func size() -> CGFloat {
        switch self {
        case .name:
            return 20
        case .captain:
            return 16
        case .players:
            return 14
        }
    }
}

class TeamForimingCellViewController: UIView {
    private var viewModel: TeamForimingCellViewModel?
    private var teamName: UILabel!
    private var teamCaptain: UILabel!
    private var players: UITextView!
    
    
    init(viewModel: TeamForimingCellViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    private func setupView() {
        teamName = setupLabel(labelType: LabelType.name, text: (viewModel?.team.name)!)
        addSubview(teamName)
        teamCaptain = setupLabel(labelType: LabelType.captain, text: (viewModel?.team.captain)!)
        addSubview(teamCaptain)
        players = setupTextView(labelType: LabelType.players, text: setPlayersInTeam(players: viewModel?.team.players))            
        addSubview(players)
        setupConstraints()
    }
    
    private func setPlayersInTeam(players: [Player]?) -> String {
        var playersInString: String = "sdfdsf"
        if let playersNN = players {
            for player in playersNN {
                playersInString.append(player.name)
                playersInString.append("\n")
            }
        }
        else {
            playersInString = "none"
        }

        return playersInString
        
    }
    
    private func setupLabel(labelType: LabelType, text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: labelType.size())
        label.text = text
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func setupTextView(labelType: LabelType, text: String) -> UITextView {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.font = UIFont.boldSystemFont(ofSize: labelType.size())
        textView.text = text
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }
    
    private func setupConstraints() {
        teamName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        teamName.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        teamName.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        teamCaptain.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        teamCaptain.topAnchor.constraint(equalTo: teamName.bottomAnchor, constant: 8).isActive = true
        teamCaptain.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        players.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        players.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        players.topAnchor.constraint(equalTo: teamCaptain.bottomAnchor, constant: 8).isActive = true
        players.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        players.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
