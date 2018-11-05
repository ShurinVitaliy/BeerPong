//
//  CardViewController.swift
//  BeerPong
//
//  Created by Admin on 05.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CardViewController: UIView {
    
    private var viewModel: CardViewModel?
    private var labelNameOfTeam: UILabel!
    
    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    
    private func setupView() {
        
    }
    
    private func setupLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = text
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
