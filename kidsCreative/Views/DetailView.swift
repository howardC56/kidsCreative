//
//  DetailView.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var activityTitle: UILabel = {
        let label = UILabel()
        label.center = self.center
        return label
    }()
    
    public lazy var activityDescription: UITextView = {
        let activityDescription = UITextView()
        return activityDescription
    }()
    
    public lazy var getStarted: UITextView = {
        let getStartedText = UITextView()
        return getStartedText
    }()
    
    public lazy var submitButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 300)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
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
        titleSetup()
        descriptionSetup()
        getStartedSetup()
        cvSetup()
    }
    
    private func titleSetup() {
        addSubview(activityTitle)
        activityTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
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
    
    
    private func submitButtonSetuo() {
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
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
}
