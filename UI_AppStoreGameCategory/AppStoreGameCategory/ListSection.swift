//
//  ListSection.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/02/21.
//

import Foundation

enum ListSection {
    case recommends([ListItem])
    case colums([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .recommends(let items):
            return items
        case .colums(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
}
