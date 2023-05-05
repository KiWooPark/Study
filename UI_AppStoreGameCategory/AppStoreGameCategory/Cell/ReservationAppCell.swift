//
//  ReservationAppCell.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/29.
//

import UIKit

class ReservationAppCell: UICollectionViewCell {
    
    @IBOutlet var appView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appView.layer.cornerRadius = 40
    }
    
}
