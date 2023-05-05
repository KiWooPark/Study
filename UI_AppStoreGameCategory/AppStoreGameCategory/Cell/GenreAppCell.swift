//
//  GenreAppCell.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/28.
//

import UIKit

class GenreAppCell: UICollectionViewCell {

    
    @IBOutlet var appView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appView.layer.cornerRadius = 10
    }
}
