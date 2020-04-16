//
//  MainViewCell.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/15/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit


class MainViewCell: UICollectionViewCell {
    
    private var currentActivity: Activity!

    
    public lazy var view: UIView = {
        let layout = UIView()
        layout.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layout.layer.masksToBounds = false
        layout.clipsToBounds = false
        layout.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) //UIColor.black.cgColor
        layout.layer.shadowOpacity = 0.5
        layout.layer.shadowOffset = CGSize.zero
        layout.layer.shadowRadius = 5
        layout.layer.cornerRadius = 8
        return layout
    }()
    
    public lazy var dateDay: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "Chalkduster", size: 20)
        label.textColor = #colorLiteral(red: 0.05060032755, green: 0.8455864191, blue: 0.8985716701, alpha: 0.9990234375)
        label.text = " 1 "
        return label
        
    }()
    
    public lazy var nameOfActivity: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "Chalkduster", size: 15)
        label.text = "Margiett"
        label.textColor = #colorLiteral(red: 0.04712193459, green: 0.7893118262, blue: 0.9092960954, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var pictureOfActivity: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "square.grid.3x2")
        imageView.tintColor = .systemOrange
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    

    
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
         setupView()
        setupDatedayLabel()
        setPictureOfActivity()
       setupNameOfActivityLabel()
       
    }
    
  
    
    private func setupDatedayLabel() { // this is the number
        addSubview(dateDay)
        dateDay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateDay.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            dateDay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])

    }
    
    private func setupNameOfActivityLabel() { // this the discription of the activity
        addSubview(nameOfActivity)
        nameOfActivity.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameOfActivity.topAnchor.constraint(equalTo: pictureOfActivity.bottomAnchor, constant: 8),
            nameOfActivity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
           nameOfActivity.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        ])
    }
    
    private func setPictureOfActivity(){ // the six little sq
        addSubview(pictureOfActivity)
        pictureOfActivity.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pictureOfActivity.centerXAnchor.constraint(equalTo: centerXAnchor),
            pictureOfActivity.centerYAnchor.constraint(equalTo: centerYAnchor),
            pictureOfActivity.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            pictureOfActivity.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
            

        ])
    }
    
  
    
    private func setupView() {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant:  -8),
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8)
            
        
        ])
    }
   
    
    public func configureCell(for savedActivity: Activity) {
        currentActivity = savedActivity
        dateDay.text = savedActivity.number.description
        nameOfActivity.text = savedActivity.name
        
    }
    
}
