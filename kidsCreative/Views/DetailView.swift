//
//  DetailView.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    private lazy var activityImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "art")
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    public lazy var activityTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)

        return label
    }()
    
    public lazy var activityDescription: UILabel = {
        let activityDescription = UILabel()
        activityDescription.numberOfLines = 0
        activityDescription.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)

        return activityDescription
    }()
    
    public lazy var getStarted: UILabel = {
        let getStartedText = UILabel()
        getStartedText.numberOfLines = 0
        getStartedText.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)

        return getStartedText
    }()
    
    public lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Add Your Work  ", for: .normal)
    
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 300)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    
    private func commonInit() {
        imageSetup()
        titleSetup()
        descriptionSetup()
        getStartedSetup()
        submitButtonSetup()
        cvSetup()
    }
    
    private func imageSetup() {
        addSubview(activityImage)
        activityImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            activityImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            activityImage.heightAnchor.constraint(equalTo: activityImage.widthAnchor),
            activityImage.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
        
    }
    private func titleSetup() {
        addSubview(activityTitle)
        activityTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityTitle.topAnchor.constraint(equalTo: activityImage.bottomAnchor, constant: 20),
            activityTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            activityTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func descriptionSetup() {
        addSubview(activityDescription)
        activityDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityDescription.topAnchor.constraint(equalTo: activityTitle.bottomAnchor, constant: 20),
            activityDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            activityDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func getStartedSetup() {
        addSubview(getStarted)
        getStarted.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getStarted.topAnchor.constraint(equalTo: activityDescription.bottomAnchor, constant: 15),
            getStarted.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            getStarted.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func submitButtonSetup() {
        addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        submitButton.topAnchor.constraint(equalTo: getStarted.bottomAnchor, constant: 20),
        submitButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func cvSetup() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
        ])
    }
    
}
