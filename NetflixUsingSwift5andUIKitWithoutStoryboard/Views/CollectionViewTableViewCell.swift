//
//  CollectionViewTableViewCell.swift
//  NetflixUsingSwift5andUIKitWithoutStoryboard
//
//  Created by Sourav on 30/12/22.
//

import UIKit
import SwiftUI

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    private var didLayoutForFirstTime = false
    
    private let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 144, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !didLayoutForFirstTime {
            didLayoutForFirstTime.toggle()
            
            collectionView.addConstraints(constraints: [
                    collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                ])
        }
    }
    
}




extension CollectionViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemCyan
        return cell
    }
}
