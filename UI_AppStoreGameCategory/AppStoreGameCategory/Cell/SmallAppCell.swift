//
//  SmallAppCell.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/02.
//

import UIKit

class SmallAppCell: UICollectionViewCell {
    
    @IBOutlet var appView: UIView!
    
    @IBOutlet var testButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appView.layer.cornerRadius = 10
    }
}
