//
//  ListCollectionViewCell.swift
//  RICCollectionViews
//
//  Created by Ricardo Ríos Arroyo on 08/02/2020.
//  Copyright © 2020 Ricardo Ríos Arroyo. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "list-cell"
    let label = UILabel()
    let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        load()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load() {
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .lightGray
        contentView.addSubview(separatorView)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
}

