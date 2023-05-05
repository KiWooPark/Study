//
//  VC4ViewController.swift
//  NaverWebToon
//
//  Created by PKW on 2023/02/14.
//

import UIKit

class VC4ViewController: UIViewController {

    // 각각 델리게이트 연결
    weak var innerCollectionViewDelegate: InnerCollectionViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
}

extension VC4ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
