//
//  HistoryViewController.swift
//  BeerPong
//
//  Created by Admin on 02.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    private var viewModel: HistoryViewModel?
    private var scrollView: UIScrollView!
    private var historyCards: [NSManagedObject] = []
    
    convenience init(viewModel: HistoryViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HistoryOfWiners")
        do {
            historyCards = try managedContext.fetch(fetchRequest)
        } catch let err as NSError{
            print("failed to fetch items", err)
        }
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
    
    private func setupConstraintsForScrollView() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
