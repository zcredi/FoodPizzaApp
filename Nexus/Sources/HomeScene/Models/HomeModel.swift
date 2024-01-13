//
//  HomeModel.swift
//  
//
//  Created by Владислав on 13.01.2024.
//

import Foundation

// MARK: - DisplayedItemElement
struct DisplayedItemElement: Codable {
    let id: Int
    let category, name: String
    let avatar: String
    let topping: [String]?
    let price: Int
}
