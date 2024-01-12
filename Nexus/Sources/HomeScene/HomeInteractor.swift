//
//  HomeInteractor.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation

protocol HomeBusinessLogic {
    
}

final class HomeInteractor: HomeBusinessLogic {
    weak var presenter: HomePresentationLogic?
    
    //MARK: - init(_:)
    init() {
    
    }
}
