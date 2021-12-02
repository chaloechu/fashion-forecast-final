//
//  OutfitViewController.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/17/21.
//

import UIKit

class OutfitViewController: UIViewController{
    private var viewLabel = UILabel()
    
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
        
        viewLabel.text = "Suggested Outfit View"
        viewLabel.textColor = .lightGray
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(viewLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
