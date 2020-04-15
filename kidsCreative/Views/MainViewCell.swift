//
//  MainViewCell.swift
//  kidsCreative
//
<<<<<<< HEAD
<<<<<<< HEAD
//  Created by Margiett Gil on 4/14/20.
=======
//  Created by Howard Chang on 4/15/20.
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
=======
//  Created by Howard Chang on 4/15/20.
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
protocol ContinueCellDelegate: AnyObject {
    func didSelectMoreButton(_ savedArticleCell: MainViewCell)
}


<<<<<<< HEAD
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
=======
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
class MainViewCell: UICollectionViewCell {
    
    public lazy var dateDay: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "Chalkduster", size: 30.0)
        label.textColor = .systemTeal
        label.text = " 1 "
        return label
        
    }()
    
    public lazy var nameOfActivity: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = UIFont(name: "Chalkduster", size: 22.0)
        label.text = "Personify Something"
        label.textColor = .systemTeal
        return label
    }()
    
    public lazy var pictureOfActivity: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "square.grid.3x2")
        imageView.tintColor = .systemOrange
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
<<<<<<< HEAD
<<<<<<< HEAD
    public lazy var circleImage: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "circle")
        imageview.contentMode = .scaleAspectFill
        imageview.tintColor = .systemTeal
        return imageview
        
    }()
    
=======
=======
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
    public lazy var circleImage: UIButton = {
        let starbutton = UIButton()
        starbutton.setImage(UIImage(systemName: "star"), for: .normal)
        starbutton.addTarget(self, action: #selector(moreButtonPressed(_ :)), for: .touchUpInside)
        //imageview.image = UIImage(systemName: "circle")
        starbutton.contentMode = .scaleAspectFill
        starbutton.tintColor = .systemTeal
        return starbutton
        
    }()
    
    @objc
    private func moreButtonPressed(_ sender: UIButton) {
        
    }
    
    public lazy var statementLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = UIFont(name: "Chalkduster", size: 17.0)
        label.text = "Start this Activity Click the Star !"
        label.textColor = .systemTeal
        return label
    }()
    
<<<<<<< HEAD
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
=======
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        setupDatedayLabel()
        setupNameOfActivityLabel()
        setPictureOfActivity()
        setupCircleImage()
    }
    
    private func setupDatedayLabel() {
        addSubview(dateDay)
        dateDay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateDay.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dateDay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])

    }
    
    private func setupNameOfActivityLabel() {
        addSubview(nameOfActivity)
        nameOfActivity.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameOfActivity.topAnchor.constraint(equalTo: dateDay.bottomAnchor, constant: 10),
            nameOfActivity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
    
    private func setPictureOfActivity(){
        addSubview(pictureOfActivity)
        pictureOfActivity.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pictureOfActivity.trailingAnchor.constraint(equalTo: nameOfActivity.leadingAnchor, constant: 15),
            pictureOfActivity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
    
    private func setupCircleImage(){
        addSubview(circleImage)
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            circleImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            circleImage.topAnchor.constraint(equalTo: pictureOfActivity.bottomAnchor, constant: 20)
        
        ])
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
=======
    private func setupdirectionLabel() {
    }
    
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
=======
    private func setupdirectionLabel() {
    }
    
>>>>>>> bcba409d06d1cd30178118c312e7ea756c761b66
    public func configureCell(){
        
    }
    
}
