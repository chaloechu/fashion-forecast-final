//
//  ClothingCollectionViewCell.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/18/21.
//

import UIKit

class ClothingCollectionViewCell: UICollectionViewCell {
    private var clothingImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.layer.borderWidth = 3
        contentView.clipsToBounds = true
        
        clothingImageView.contentMode = .scaleAspectFit
        clothingImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(clothingImageView)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for clothing:Clothing){
        clothingImageView.image = UIImage(named: clothing.imageName)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            clothingImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            clothingImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            clothingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            clothingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
}
