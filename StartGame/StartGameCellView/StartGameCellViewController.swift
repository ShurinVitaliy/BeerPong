//
//  StartGameCellViewController.swift
//  BeerPong
//
//  Created by Admin on 29.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class StartGameCellViewController: UITableViewCell {
    private var viewModel: StartGameCellViewModel?
    
    private var teamN1: UILabel!
    private var teamN2: UILabel!
    private var winer: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    func apply(viewModel: StartGameCellViewModel) {
        self.viewModel = viewModel
        setupView()
    }
    
    private func setupView() {
        teamN1 = setupLabelNameOfTeam(text: (viewModel?.competitions.competiter1.name)!)
        addSubview(teamN1)
        teamN2 = setupLabelNameOfTeam(text: (viewModel?.competitions.competiter2.name)!)
        addSubview(teamN2)
        winer = setupLabelNameOfTeam(text: (viewModel?.competitions.nameOfViner())!)
        addSubview(winer)
        setupContraints()
    }
    
    private func setupLabelNameOfTeam(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = text
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func setupContraints() {
        teamN1.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        teamN1.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        teamN1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        teamN1.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        
        teamN2.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        teamN2.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        teamN2.topAnchor.constraint(equalTo: teamN1.bottomAnchor).isActive = true
        teamN2.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        
        winer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        winer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        winer.topAnchor.constraint(equalTo: teamN2.bottomAnchor).isActive = true
        winer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        winer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
