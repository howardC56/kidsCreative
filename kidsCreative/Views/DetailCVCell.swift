//
//  DetailCVCell.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/15/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class DetailCVCell: UICollectionViewCell {
    
    public lazy var mediaImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    func configureCell(for mediaObject: MediaObject) {
        if let imageData = mediaObject.imageData {
            mediaImageView.image = UIImage(data: imageData)
        }
        if let videoURL = mediaObject.videoData?.convertToURL() {
            let image = videoURL.videoPreviewThumbnail() ?? UIImage(systemName: "heart")
            mediaImageView.image = image
        }
    }
    
    
    private func commonInit() {
        setupMediaImage()
    }
    
    private func setupMediaImage() {
        addSubview(mediaImageView)
        mediaImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mediaImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mediaImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mediaImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mediaImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}
