//
//  RankAppSection.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/03/02.
//

import UIKit

struct RankAppSection: Section {
    let name: String = ""
    let numberOfItems = 15

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0/3.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 30, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }


    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RankAppCell.self), for: indexPath) as? RankAppCell else { return UICollectionViewCell() }
        cell.rankLabel.text = "\(indexPath.row + 1)"
        return cell
    }
}

