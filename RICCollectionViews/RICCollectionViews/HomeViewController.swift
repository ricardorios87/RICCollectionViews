//
//  HomeViewController.swift
//  RICCollectionViews
//
//  Created by Ricardo Ríos Arroyo on 02/02/2020.
//  Copyright © 2020 Ricardo Ríos Arroyo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    enum Section {
        case main
    }
    
    var menuItems = ["As a table","Item2","Item3","Item4","Item5","Item6","Item7","Item8","Item9"]
    
    var dataSource: UITableViewDiffableDataSource<Section,String>!
    var tableView: UITableView!
    let collectionListViewController = CollectionListViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection Views"
        createTableView()
        createDataSource()
        dataSource.apply(initialSnapshot())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func createTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate ([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func createDataSource() {
        dataSource = UITableViewDiffableDataSource<Section,String>(tableView: tableView, cellProvider: { (tableView, indexPath, menuItem) -> UITableViewCell? in
            var cell = tableView.dequeueReusableCell(withIdentifier: "cello")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cello")
            }
            
            cell?.textLabel?.text = menuItem
            return cell
        })
    }
    
    func initialSnapshot() -> NSDiffableDataSourceSnapshot<Section,String> {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(menuItems)
        return snapshot
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let navController = UINavigationController(rootViewController: collectionListViewController)
            present(navController, animated: true)
        }
    }
    
}
