//
//  File.swift
//  
//
//  Created by Владислав on 13.01.2024.
//

import Foundation
import APIManager

protocol ItemsWorkerProtocol {
    func fetchItems(completion: @escaping (Result<[DisplayedItemElement], NetworkError>) -> Void)
}

final class ItemsWorker: ItemsWorkerProtocol {
    let networkService: NetworkProtocol

    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func fetchItems(completion: @escaping (Result<[DisplayedItemElement], NetworkError>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/3892dfee-dd34-4715-957d-e74807b4ece1") else {
            completion(.failure(.badRequest))
            return
        }
        networkService.fetchData(url: url, completion: completion)
    }
}
