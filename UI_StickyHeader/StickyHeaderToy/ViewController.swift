//
//  ViewController.swift
//  StickyHeaderToy
//
//  Created by PKW on 2023/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var topImageView: UIImageView!
    @IBOutlet var topImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet var bottomViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        bottomViewTopConstraint.constant = (self.view.frame.height / 2)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let scale = (self.view.frame.height - scrollView.contentOffset.y * 4) / self.view.frame.height

        if scrollView.contentOffset.y < 0 {
            topImageViewTopConstraint.constant = 0
            topImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        } else {
            topImageViewTopConstraint.constant = -scrollView.contentOffset.y
        }
    }
}


