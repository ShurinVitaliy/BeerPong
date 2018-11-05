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
    private var cardView = [CardViewController]()
    
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
            for nameCards in historyCards {
                cardView.append(CardViewController(viewModel: CardViewModelImp(nameOfTeam: (nameCards.value(forKey: "teamName") as? String)!)))
                print(cardView.count)
            }
        } catch let err as NSError{
            print("failed to fetch items", err)
        }
        addViewInScrollView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = createScrollView()
        view.addSubview(scrollView)
        setupConstraintsForScrollView()
    }
    
    private func createScrollView() -> UIScrollView {
        let scrolView = UIScrollView()
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        scrolView.backgroundColor = .darkGray
        
        return scrolView
    }
    
    private func addViewInScrollView() {
        for (index, card) in cardView.enumerated() {
            scrollView.addSubview(card)
            card.translatesAutoresizingMaskIntoConstraints = false
            card.backgroundColor = .white
            setupConstraintsForCardView(index: index, card: card)
        }
    }
    
    private func setupConstraintsForCardView(index: Int, card: CardViewController) {
        
        card.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        card.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        card.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        card.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1/7).isActive = true
        
        if index == 0 {
            card.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        } else {
            card.topAnchor.constraint(equalTo: cardView[index - 1].bottomAnchor, constant: 8).isActive = true
        }
        if index == cardView.count - 1  {
            card.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
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
