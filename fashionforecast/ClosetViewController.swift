//
//  ClosetViewController.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/17/21.
//

import UIKit
import SnapKit

class ClosetViewController: UIViewController{
    
    private var clothingCollectionView: UICollectionView!
    
    private var sections = ["Tops", "Bottoms", "Jackets", "Shoes"]
    
    private var clothingItems : [[Clothing]] = [
        [Clothing(imageName: "short sleeve top", type: "tops", description: "tops", season: "summer"), Clothing(imageName: "sweater", type: "tops", description: "sweater", season: "winter")],
        [Clothing(imageName: "jeans", type: "bottoms", description: "jeans", season: "spring"), Clothing(imageName: "skirt", type: "bottoms", description: "skirt", season: "summer")],
        [Clothing(imageName: "denim jacket", type: "jackets", description: "denim jacket", season: "spring"),
        Clothing(imageName: "puffer jacket", type: "jackets", description: "puffer jacket", season: "fall")],
        [Clothing(imageName: "sneakers", type: "shoes", description: "sandals", season: "summer"), Clothing(imageName: "sandals", type: "shoes", description: "sneakers", season: "summer")]
    ]
    
    // set up constants
    private let clothingCellReuseIdentifier = "clothingCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Clothing"
        view.backgroundColor = .white
        
        // Set up flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
    
    
        // Instantiate collectionview
        clothingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clothingCollectionView.backgroundColor = .clear
        clothingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create collection view cell and register it here.
        clothingCollectionView.register(ClothingCollectionViewCell.self, forCellWithReuseIdentifier: clothingCellReuseIdentifier)
        
        // Set collection view data source
        clothingCollectionView.dataSource = self
        
        // Set collection view delegate
        clothingCollectionView.delegate = self
        
        // Register header view
        clothingCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        view.addSubview(clothingCollectionView)
        setupConstraints()
    }
    
    func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            clothingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            clothingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            clothingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            clothingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
}

// Conform to UICollectionViewDataSource
extension ClosetViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clothingItems[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier: clothingCellReuseIdentifier, for: indexPath) as! ClothingCollectionViewCell
        let clothing = clothingItems[indexPath.section][indexPath.item]
        cell.configure(for: clothing)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header =
        collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderView
        let section = sections[indexPath.section]
        header.configure(for: section)
        return header
    }
}

// Conform to UICollectionViewDelegateFlowLayout
extension ClosetViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numItemsPerRow: CGFloat = 2.0
        let size = (collectionView.frame.width - cellPadding) / numItemsPerRow
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
}
