//
//  InnerCollectionViewDelegate.swift
//  NaverWebToon
//
//  Created by PKW on 2023/02/14.
//

import Foundation
import UIKit

protocol InnerCollectionViewDelegate: AnyObject {
    func didScroll(distance: CGFloat)
}
