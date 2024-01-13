//
//  File.swift
//  
//
//  Created by Владислав on 13.01.2024.
//

import Foundation

enum HomeSection {
    case sales([HomeItem])
    case category([HomeItem])
    case food([HomeItem])
    
    var items: [HomeItem] {
        switch self  {
        case .sales(let items),
                .category(let items),
                .food(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
}
