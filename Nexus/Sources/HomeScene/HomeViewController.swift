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
}
