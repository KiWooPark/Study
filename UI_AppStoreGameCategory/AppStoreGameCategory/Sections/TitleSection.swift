//
//  TitleSection.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/02.
//

import UIKit

struct TitleSection: Section {
    let name: String = ""
    let numberOfItems = 1
    
    private let isHiddenSubTitle: Bool
    private let isHiddenMoreButton: Bool
    
    init(isHiddenSubTitle: Bool = false, isHiddenMoreButton: Bool = false) {
        self.isHiddenSubTitle = isHiddenSubTitle
        self.isHiddenMoreButton = isHiddenMoreButton
    }

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 5, trailing: 20)
        
        return section
    }

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TitleSectionCell.self), for: indexPath) as? TitleSectionCell else { return UICollectionViewCell() }
        cell.subTitleLabel.isHidden = isHiddenSubTitle
        cell.moreButton.isHidden = isHiddenMoreButton
        return cell
    }
}
