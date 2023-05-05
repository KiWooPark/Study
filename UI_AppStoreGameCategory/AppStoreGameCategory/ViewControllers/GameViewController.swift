//
//  ViewController.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/02/21.
//

import UIKit

class GameViewController: UIViewController {

    lazy var sections: [Section] = [
//        FeaturedAppSection(),
//        TitleSection(),
        SmallAppSection()
//        TitleSection(isHiddenSubTitle: true),
//        RankAppSection(),
//        TitleSection(isHiddenSubTitle: true),
//        MediumAppSection(),
//        TitleSection(isHiddenSubTitle: true, isHiddenMoreButton: true),
//        EventAppSection(),
//        TitleSection(isHiddenSubTitle: true, isHiddenMoreButton: true),
//        GenreAppSection(),
//        TitleSection(),
//        ReservationAppSection(),
//        TitleSection(isHiddenSubTitle: true, isHiddenMoreButton: false),
//        CategorySection()
    ]
    
    lazy var appStoreCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: appStoreCollectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: String(describing: ExtraLargeAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ExtraLargeAppCell.self))
        collectionView.register(UINib(nibName: String(describing: TitleSectionCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TitleSectionCell.self))
        collectionView.register(UINib(nibName: String(describing: SmallAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SmallAppCell.self))
        collectionView.register(UINib(nibName: String(describing: RankAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: RankAppCell.self))
        collectionView.register(UINib(nibName: String(describing: MediumAppCell
            .self), bundle: nil), forCellWithReuseIdentifier: String(describing: MediumAppCell.self))
        collectionView.register(UINib(nibName: String(describing: EventAppCell.self
            .self), bundle: nil), forCellWithReuseIdentifier: String(describing: EventAppCell.self))
        collectionView.register(UINib(nibName: String(describing: GenreAppCell.self
            .self), bundle: nil), forCellWithReuseIdentifier: String(describing: GenreAppCell.self))
        collectionView.register(UINib(nibName: String(describing: ReservationAppCell.self
            .self), bundle: nil), forCellWithReuseIdentifier: String(describing: ReservationAppCell.self))
        collectionView.register(UINib(nibName: String(describing: CategoryCell.self
            .self), bundle: nil), forCellWithReuseIdentifier: String(describing: CategoryCell.self))
        
        return collectionView
    }()
    
    lazy var appStoreCollectionViewLayout: UICollectionViewLayout = {
        let sections = self.sections
        
        let layout = UICollectionViewCompositionalLayout { (index, env) -> NSCollectionLayoutSection? in
            return sections[index].layoutSection()
        }
        
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configurCollectionView()
    }
    
    func configurCollectionView() {
        appStoreCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appStoreCollectionView)
        
        NSLayoutConstraint.activate([
            appStoreCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            appStoreCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            appStoreCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appStoreCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func test() {
        print("!23123")
    }
}

extension GameViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let aaa = sections[indexPath.section]

        switch aaa.name {
        case "SmallAppSection":
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SmallAppCell.self), for: indexPath) as? SmallAppCell else { return UICollectionViewCell() }
            cell.testButton.addTarget(self, action: #selector(test), for: .touchUpInside)
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
        
        
        
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension GameViewController: UICollectionViewDelegate {
    
}


