//
//  HomePresenter.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation
import APIManager

struct DisplayedItemViewModel {
    let id: Int
    let category: String
    let name: String
    let avatarURL: URL?
    let toppingsDescription: String
    let formattedPrice: String

    init(from element: DisplayedItemElement) {
        id = element.id
        category = element.category
        name = element.name
        avatarURL = URL(string: element.avatar)
        
        toppingsDescription = element.topping?.joined(separator: ", ") ?? "Без дополнений"

        formattedPrice = "от \(element.price) ₽"
    }
}

protocol HomePresentationLogic: AnyObject {
    func presentFetchedItems(items: [DisplayedItemElement])
    func presentError(error: NetworkError)
}

final class HomePresenter: HomePresentationLogic {
    weak var view: HomeDisplayLogic?
    
    init() {
    
    }

    func presentFetchedItems(items: [DisplayedItemElement]) {
        // Преобразование данных для отображения
        let displayedItems = items.map { DisplayedItemViewModel(from: $0) }
        view?.displayFetchedItems(items: displayedItems)
    }

    func presentError(error: NetworkError) {
        // Преобразование ошибки в формат для отображения
        let errorMessage = error.localizedDescription
        view?.displayError(message: errorMessage)
    }
}
