//
//  UpwardsBlurEdge.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/02/21.
//

import UIKit

class UpwardsBlurEdge: UIVisualEffectView {
    
    lazy var grad: CAGradientLayer = {
        let g = CAGradientLayer()
        g.colors = [
            UIColor.black.cgColor,
            UIColor.clear.cgColor
        ]
        g.startPoint = CGPoint(x: 0.5, y: 1)
        g.endPoint = CGPoint(x: 0.5, y: 0)
        layer.mask = g
        return g
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        grad.frame = bounds
    }
}
