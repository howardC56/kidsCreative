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
        image.image = UIImage(named: "art")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemYellow
        return cv
    }()
    
    public lazy var imageFish: UIImageView = {
        let fish = UIImageView()
        fish.image = UIImage(named: "art")
        fish.contentMode = .scaleAspectFill
        return fish
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
        setupFishImage()
    }
    
    private func setupImage(){
        addSubview(headlineImage)
        headlineImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headlineImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            headlineImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            headlineImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            headlineImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30)
        
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
    
    private func setupFishImage() {
        addSubview(imageFish)
        imageFish.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageFish.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            imageFish.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageFish.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageFish.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            
        
        ])
    }
}
