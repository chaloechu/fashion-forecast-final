//
//  ClothingCollectionViewCell.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/18/21.
//

import UIKit

class ClothingCollectionViewCell: UICollectionViewCell {
    private var clothingImageView = UIImageView()
    private var clothingLabel = UILabel()
    private var clothingDesc = UITextView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        clothingImageView.contentMode = .scaleAspectFit
        clothingImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(clothingImageView)
        
        clothingLabel.textColor = .black
        clothingLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        clothingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(clothingLabel)
        
        clothingDesc.textColor = .lightGray
        clothingDesc.font = .systemFont(ofSize: 15, weight: .regular)
        clothingDesc.textAlignment = .center
        clothingDesc.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(clothingDesc)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for clothing:Clothing){
        clothingImageView.image = UIImage(named: clothing.imageName)
        clothingLabel.text = clothing.type
        clothingDesc.text = clothing.description
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            clothingImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            clothingImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            clothingImageView.heightAnchor.constraint(equalToConstant: 100),
            clothingImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            clothingLabel.topAnchor.constraint(equalTo: clothingImageView.bottomAnchor, constant: 10),
            clothingLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            clothingDesc.topAnchor.constraint(equalTo: clothingLabel.bottomAnchor, constant: 10),
            clothingDesc.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}
