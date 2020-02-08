//
//  CollectionListViewController.swift
//  RICCollectionViews
//
//  Created by Ricardo Ríos Arroyo on 08/02/2020.
//  Copyright © 2020 Ricardo Ríos Arroyo. All rights reserved.
//

import UIKit

class CollectionListViewController: UIViewController {

    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List"
        createCollectionView()
        createDataSource()
        dataSource.apply(initialSnapshot())
    }
    
    func createCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier)
    }

    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, number) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as? ListCollectionViewCell else {
                fatalError("Not able to dequeu the cell")
            }
            
            cell.label.text = "\(number)"
            
            return cell
        })
    }
    
    func layout() -> UICollectionViewCompositionalLayout {
        
        let generalSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(50))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: generalSize)
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: generalSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        
        return UICollectionViewCompositionalLayout(section: layoutSection)
    }
    
    func initialSnapshot() -> NSDiffableDataSourceSnapshot<Section,Int> {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(1..<100))
        return snapshot
    }
}
