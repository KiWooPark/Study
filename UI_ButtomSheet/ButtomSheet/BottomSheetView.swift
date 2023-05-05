//
//  BottomSheetViewController.swift
//  ButtomSheet
//
//  Created by PKW on 2023/03/07.
//

import UIKit

class BottomSheetView: UIView {
    
    enum Mode {
        case tip
        case middle
        case full
    }
    
    enum CalcValue {
        static let bottomSheetRatio: (Mode) -> Double = { mode in
            switch mode {
            case .tip:
                return 0.85
            case .middle:
                return 0.6
            case .full:
                return 0.15
            }
        }
        
        static let bottomSheetYPosition: (Mode) -> Double = { mode in
            Self.bottomSheetRatio(mode) * UIScreen.main.bounds.height
        }
    }
    
    var mode: Mode = .tip {
        didSet {
            switch self.mode {
            case .tip:
                break
            case .middle:
                break
            case .full:
                break
            }
            self.updateConstraint(offset: CalcValue.bottomSheetYPosition(self.mode))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func setup() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        self.addGestureRecognizer(panGesture)
        
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        
        if let top = superview?.constraints.filter({$0.identifier == "top"}) {
            top.first?.constant = CalcValue.bottomSheetYPosition(.middle)
        }
    }
    
    @objc func didPan(_ recognizer: UIPanGestureRecognizer) {

        let translationY = recognizer.translation(in: self).y
        let minY = self.frame.minY
        let offset = translationY + minY
        
        // 지정한 값에 포함 되어 있을 경우에만 변경
        if CalcValue.bottomSheetYPosition(.full) ... CalcValue.bottomSheetYPosition(.tip) ~= offset {
            updateConstraint(offset: offset)
            self.superview?.layoutIfNeeded()
            recognizer.setTranslation(.zero, in: self)
        }

        guard recognizer.state == .ended else { return }

        if recognizer.velocity(in: self).y < 0 {
            // 위
            if CalcValue.bottomSheetYPosition(.middle) ... CalcValue.bottomSheetYPosition(.tip) ~= offset {
                self.mode = .middle
            } else if CalcValue.bottomSheetYPosition(.full) ... CalcValue.bottomSheetYPosition(.middle) ~= offset {
                self.mode = .full
            }
        } else {
            // 아래
            if CalcValue.bottomSheetYPosition(.full) ... CalcValue.bottomSheetYPosition(.middle) ~= offset {
                self.mode = .middle
            } else if CalcValue.bottomSheetYPosition(.middle) ... CalcValue.bottomSheetYPosition(.tip) ~= offset {
                self.mode = .tip
            }
        }

        UIView.animate(
            withDuration: 0.35,
            delay: 0,
            options: .allowUserInteraction, // 애니메이션 동작시 이벤트 허용
            animations: {
                self.superview?.layoutIfNeeded()

            },
            completion: nil
        )
    }
    
    func updateConstraint(offset: Double) {
        if let top = superview?.constraints.filter({$0.identifier == "top"}) {
            top.first?.constant = offset
        }
    }
}


