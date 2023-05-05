//
//  ListItem.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/02/21.
//

import Foundation
import UIKit

struct ListItem {
    let status: StatusType?
    let subStatus: SubStatusType?
    let title: String
    let subTitle: String?
    let description: String?
    
    init(status: StatusType? = nil, subStatus: SubStatusType? = nil, title: String, subTitle: String? = nil, description: String? = nil) {
        self.status = status
        self.subStatus = subStatus
        self.title = title
        self.subTitle = subTitle
        self.description = description
    }
}

struct TitleItem {
    let title: String
    let subTitle: String?
    
    init(title: String, subTitle: String? = nil) {
        self.title = title
        self.subTitle = subTitle
    }
}



