//
//  ExtraLargeAppCell.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/02.
//

import UIKit

class ExtraLargeAppCell: UICollectionViewCell {
    
    @IBOutlet var appView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appView.layer.cornerRadius = 5
    }
    
}
