//
//  ViewController.swift
//  naverWebToon2
//
//  Created by PKW on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bottomBaseScrollView: UIScrollView!
    @IBOutlet var bannerView: UIView!
    
    @IBOutlet var categoryScrollView: UIScrollView!
    
    @IBOutlet var categoryButtons: [UIButton]!
    
    @IBOutlet var underlineView: UIView!

    @IBOutlet var underlineViewWidth: NSLayoutConstraint!
    
    @IBOutlet var underlineViewCenterX: [NSLayoutConstraint]!
       
    var selectedIndex = 0
    var categoryWidth = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        underlineViewWidth.constant = categoryButtons[0].frame.width * 0.8
    }
    
    @IBAction func tapCategoryButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
    
        switch button.tag {
        case 0:
            updateCenter(index: 0)
            moveBottomView(index: 0)
            selectedIndex = 0
            categoryScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        case 1:
            updateCenter(index: 1)
            moveBottomView(index: 1)
            selectedIndex = 1
        case 2:
            updateCenter(index: 2)
            moveBottomView(index: 2)
            selectedIndex = 2
        case 3:
            updateCenter(index: 3)
            moveBottomView(index: 3)
            selectedIndex = 3
        case 4:
            updateCenter(index: 4)
            moveBottomView(index: 4)
            selectedIndex = 4
        case 5:
            updateCenter(index: 5)
            moveBottomView(index: 5)
            selectedIndex = 5
        case 6:
            updateCenter(index: 6)
            moveBottomView(index: 6)
            selectedIndex = 6
        case 7:
            updateCenter(index: 7)
            moveBottomView(index: 7)
            selectedIndex = 7
        case 8:
            updateCenter(index: 8)
            moveBottomView(index: 8)
            selectedIndex = 8
        case 9:
            moveBottomView(index: 9)
            selectedIndex = 9
            
            let x = categoryScrollView.contentSize.width - self.view.frame.width
            
            categoryScrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        default:
            print("default")
        }
        
        UIView.animate(withDuration: 0.5) {
            self.underlineViewWidth.constant = button.frame.width * 0.8
            self.view.layoutIfNeeded()
        }
        
    }
    
    func updateCenter(index: Int) {
        self.underlineViewCenterX.forEach { constraint in
            if constraint.identifier == "\(index)" {
                constraint.priority = .defaultHigh
            } else {
                constraint.priority = .defaultLow
            }
        }
    }
    
    func moveBottomView(index: Int) {
        UIView.animate(withDuration: 0.5) {
            self.bottomBaseScrollView.contentOffset.x = (CGFloat(index + 1) * self.view.frame.width) - self.view.frame.width
            self.view.layoutIfNeeded()
        }
    }
}



extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.tag {
        case 100:
            print("")
        case 101:
            let index = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))

            let width = categoryButtons[index].frame.width

            UIView.animate(withDuration: 0.5) {
                self.underlineViewCenterX.forEach { constraint in
                    if constraint.identifier == "\(index)" {
                        constraint.priority = .defaultHigh
                    } else {
                        constraint.priority = .defaultLow
                    }
                }

                self.underlineViewWidth.constant = width * 0.8
                self.view.layoutIfNeeded()
            }

            
            underlineView.frame.origin.x = scrollView.contentOffset.x / 10
            
        default:
            print("default")
        }
    }
}



