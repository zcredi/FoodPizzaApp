//
//  HomeInteractor.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation

protocol HomeBusinessLogic {
    func fetchItems()
}

final class HomeInteractor: HomeBusinessLogic {
    weak var presenter: HomePresentationLogic?
    var worker: ItemsWorkerProtocol?

    init(worker: ItemsWorkerProtocol) {
        self.worker = worker
    }

    func fetchItems() {
        worker?.fetchItems { [weak self] result in
            switch result {
            case .success(let items):
                self?.presenter?.presentFetchedItems(items: items)
            case .failure(let error):
                self?.presenter?.presentError(error: error)
            }
        }
    }
}
