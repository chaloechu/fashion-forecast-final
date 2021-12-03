//
//  OutfitCollectionViewCell.swift
//  fashionforecast
//
//  Created by Chloe Chu on 12/2/21.
//

import UIKit

class OutfitCollectionViewCell: UICollectionViewCell {
    private var imageView = UIImageView()
    private var clothingLabel = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        clothingLabel.textColor = .black
        clothingLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        clothingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(clothingLabel)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            clothingLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            clothingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15)
        ])
    }
    
    func configure(for clothing: Clothing){
        imageView.image = UIImage(named: clothing.imageName)
        clothingLabel.text = clothing.description
    }
}
