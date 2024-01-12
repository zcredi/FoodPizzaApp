//
//  HomePresenter.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation

protocol HomePresentationLogic: AnyObject {
}

final class HomePresenter: HomePresentationLogic {
    weak var view: HomeDisplayLogic?
    
    //MARK: - init(_:)
    init() {
    
    }
}
