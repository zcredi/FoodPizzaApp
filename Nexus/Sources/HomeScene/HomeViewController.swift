//
//  HomeViewController.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import UIKit

protocol HomeView: UIView {
    //    var actionButton: UIButton { get }
}

protocol HomeDisplayLogic: AnyObject {
    func displayFetchedItems(items: [DisplayedItemViewModel])
    func displayError(message: String)
}

public final class HomeViewController: UIViewController {
    var interactor: HomeBusinessLogic?
    
    //MARK: - init(_:)
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Circle
    public override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchItems()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
    }
    
    
    func displayFetchedItems(items: [DisplayedItemViewModel]) {
        // Обновление данных коллекции
    }
    
    func displayError(message: String) {
        // Отображение ошибки
    }
}

extension HomeViewController {
    func setConstraints() {
        
    }
}
