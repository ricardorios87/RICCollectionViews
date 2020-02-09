//
//  CollectionListSectionViewController.swift
//  RICCollectionViews
//
//  Created by Ricardo Ríos Arroyo on 09/02/2020.
//  Copyright © 2020 Ricardo Ríos Arroyo. All rights reserved.
//

import UIKit

class CollectionListSectionViewController: UIViewController {

    enum Section {
        case units
        case tenths
        case twenties
        case thirties
    }
    
    var sections = ["Units", "Tenths", "Twenties", "Thirties"]
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    var collectionView: UICollectionView!
    var pin = false
    
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
        collectionView.register(TitleSectionView.self, forSupplementaryViewOfKind: "section-header", withReuseIdentifier: TitleSectionView.reuseIdentifier)
    }

    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, number) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as? ListCollectionViewCell else {
                fatalError("Not able to dequeu the cell")
            }
            
            cell.label.text = "\(number)"
            
            return cell
        })
        dataSource.supplementaryViewProvider = {(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let section = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleSectionView.reuseIdentifier, for: indexPath) as? TitleSectionView else {
                fatalError("Not able to dequeue section view")
            }
            
            section.label.text = self.sections[indexPath.section]
            return section
        }
    }
    
    func layout() -> UICollectionViewCompositionalLayout {
        
        let generalSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(44))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: generalSize)
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: generalSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: "section-header", alignment: .top)
        
        sectionHeader.pinToVisibleBounds = pin
        layoutSection.boundarySupplementaryItems = [sectionHeader]
        return UICollectionViewCompositionalLayout(section: layoutSection)
    }
    
    func initialSnapshot() -> NSDiffableDataSourceSnapshot<Section,Int> {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Int>()
        snapshot.appendSections([.units, .tenths, .twenties, .thirties])
        snapshot.appendItems(Array(0..<10),toSection: .units)
        snapshot.appendItems(Array(10..<20),toSection: .tenths)
        snapshot.appendItems(Array(20..<30),toSection: .twenties)
        snapshot.appendItems(Array(30..<40),toSection: .thirties)
        return snapshot
    }

}
