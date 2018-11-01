//
//  HistoryViewController.swift
//  BeerPong
//
//  Created by Admin on 02.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    private var viewModel: HistoryViewModel?
    private var scrollView: UIScrollView!
    private var historyCards = [String]()
    
    convenience init(viewModel: HistoryViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func createScrollView() -> UIScrollView {
        let scrolView = UIScrollView(frame: view.bounds)
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        scrolView.backgroundColor = .darkGray
        for (index, card) in historyCards.enumerated() {
            
        }
        return scrolView
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
