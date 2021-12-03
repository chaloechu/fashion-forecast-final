//
//  OutfitViewController.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/17/21.
//

import UIKit

class OutfitViewController: UIViewController{
    private var viewLabel = UILabel()
    private var clothing: [[Clothing]] = []
    private var outfit: [Clothing] = []
    
    private var collectionView: UICollectionView!
    
    private let outfitCellReuseIdentifier = "outfitCellReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    
    private var refreshButton = UIButton()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Suggested Outfit"
        view.backgroundColor = .white
        createDummyData()
        chooseClothing()
        
        viewLabel.text = "Suggested Outfit"
        viewLabel.textColor = .lightGray
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        view.addSubview(viewLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(OutfitCollectionViewCell.self, forCellWithReuseIdentifier: outfitCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        refreshButton.layer.borderWidth = 1
        refreshButton.layer.borderColor = UIColor.black.cgColor
        refreshButton.layer.cornerRadius = 5
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.backgroundColor = .clear
        refreshButton.setTitle("New Outfit", for: .normal)
        refreshButton.setTitleColor(.black, for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshData), for: .touchUpInside)
        view.addSubview(refreshButton)
        
        setUpConstraints()
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
    
    
    func setUpConstraints(){
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: viewLabel.bottomAnchor, constant: collectionViewPadding + 5),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        NSLayoutConstraint.activate([
            refreshButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            refreshButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            refreshButton.leadingAnchor.constraint(equalTo: viewLabel.leadingAnchor),
            refreshButton.trailingAnchor.constraint(equalTo: viewLabel.trailingAnchor)
        ])
    }
    
    func chooseClothing(){
        for sections in clothing{
            let clothingItem = sections.randomElement()!
            outfit.append(clothingItem)
        }
    }
    
    @objc func refreshData(){
        outfit = []
        chooseClothing()
        collectionView.reloadData()
    }
}

extension OutfitViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return outfit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: outfitCellReuseIdentifier, for: indexPath) as! OutfitCollectionViewCell
        let clothingItem = outfit[indexPath.item]
        cell.configure(for: clothingItem)
        return cell
    }
}

extension OutfitViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numItemsPerRow: CGFloat = 2.0
        let size = (collectionView.frame.width - cellPadding) / numItemsPerRow
        return CGSize(width: size, height: size)
    }
}
