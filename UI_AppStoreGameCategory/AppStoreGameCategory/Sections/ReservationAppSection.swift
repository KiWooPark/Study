//
//  ReservationAppSection.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/29.
//

import UIKit

struct ReservationAppSection: Section {
    let name: String = ""
    let numberOfItems = 10

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 30, trailing: 15)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }


    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ReservationAppCell.self), for: indexPath) as? ReservationAppCell else { return UICollectionViewCell() }
        return cell
    }
}
