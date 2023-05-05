//
//  VC7ViewController.swift
//  NaverWebToon
//
//  Created by PKW on 2023/03/27.
//

import UIKit

class VC7ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension VC7ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
