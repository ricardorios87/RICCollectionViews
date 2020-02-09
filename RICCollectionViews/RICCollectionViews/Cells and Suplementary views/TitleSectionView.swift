//
//  TItleSectionView.swift
//  RICCollectionViews
//
//  Created by Ricardo Ríos Arroyo on 09/02/2020.
//  Copyright © 2020 Ricardo Ríos Arroyo. All rights reserved.
//

import UIKit

class TitleSectionView: UICollectionReusableView {
       
    static let reuseIdentifier = "title-section"
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
        addSubview(separatorView)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        backgroundColor = .systemGroupedBackground
    }
}
