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
    
    private var clothing: [[Clothing]] = []
    private var sections = ["Tops", "Bottoms", "Jackets", "Shoes"]
    
    private var clothingCellReuseIdentifier = "clothingCellReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    
    private var viewLabel = UILabel()
    
    init(){
        super.init(nibName: nil, bundle: nil)
//        createDummyData()
    }
    
    func createDummyData(){
        let longSleeveShirt = Clothing(imageName: "tops", type: "Tops", description: "Long Sleeve Shirt", season: "Winter")
        let shortSleeveShirt = Clothing(imageName: "tops", type: "Tops", description: "Short Sleeve Shirt", season: "Summer")
        let slacks = Clothing(imageName: "bottoms", type: "Bottoms", description: "Long Slacks", season: "Fall")
        let skirt = Clothing(imageName: "bottoms", type: "Bottoms", description: "Skirt", season: "Spring")
        let vest = Clothing(imageName: "jackets", type: "Jackets", description: "black vest", season: "Fall")
        let raincoat = Clothing(imageName: "jackets", type: "Jackets", description: "yellow raincoat", season: "Spring")
        let sneakers = Clothing(imageName: "shoes", type: "Shoes", description: "white sneakers", season: "Any")
        let dressShoes = Clothing(imageName: "shoes", type: "Shoes", description: "black dress shoes", season: "Any")
        clothing = [[longSleeveShirt, shortSleeveShirt], [slacks, skirt], [vest, raincoat], [sneakers, dressShoes]]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Closet"
        view.backgroundColor = .white
        
        viewLabel.text = "My Closet View"
        viewLabel.textColor = .lightGray
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(viewLabel)

//        let clothingLayout = UICollectionViewFlowLayout()
//        clothingLayout.scrollDirection = .vertical
//        clothingLayout.minimumLineSpacing = cellPadding
//        clothingLayout.minimumInteritemSpacing = cellPadding
//        clothingLayout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
//
//        clothingCollectionView = UICollectionView(frame: .zero , collectionViewLayout: clothingLayout)
//        clothingCollectionView.backgroundColor = .clear
//        clothingCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        clothingCollectionView.register(ClothingCollectionViewCell.self, forCellWithReuseIdentifier: clothingCellReuseIdentifier)
//        clothingCollectionView.dataSource = self
//        clothingCollectionView.delegate = self
//        view.addSubview(clothingCollectionView)

        setUpConstraints()
    }
//
    func setUpConstraints(){
//        let collectionViewPadding: CGFloat = 12
//        NSLayoutConstraint.activate([
//            clothingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
//            clothingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
//            clothingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
//            clothingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
//        ])
        NSLayoutConstraint.activate([
            viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

//extension ClosetViewController: UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return sections.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = clothingCollectionView.dequeueReusableCell(withReuseIdentifier: clothingCellReuseIdentifier, for: indexPath) as! ClothingCollectionViewCell
//        let clothing = clothing[indexPath.section][indexPath.item]
//        cell.configure(for: clothing)
//        return cell
//    }
//
//}
//extension ClosetViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numsPerRow: CGFloat = 2.0
//        let size = (collectionView.frame.width - cellPadding) / numsPerRow
//        return CGSize(width: size, height: size)
//    }
//
//}
