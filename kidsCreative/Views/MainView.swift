//
//  MainView.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    private var currentActivity: Activity!
    
    
    public lazy var headlineImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "header")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit(){
        setupImage()
        setupCollectionViewConstraints()
        
    }
    
    private func setupImage(){
        addSubview(headlineImage)
        headlineImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headlineImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            headlineImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            headlineImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            headlineImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10)
        
        ])
    }
    
    private func setupCollectionViewConstraints(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headlineImage.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    

}
