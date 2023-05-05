//
//  RankAppCell.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/02.
//

import UIKit

class RankAppCell: UICollectionViewCell {
    
    @IBOutlet var rankLabel: UILabel!
    
    @IBOutlet var appView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appView.layer.cornerRadius = 10
    }
    
}
