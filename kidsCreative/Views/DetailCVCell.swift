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
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public lazy var playButton: UIImageView = {
        let button = UIImageView()
        
        button.tintColor = .gray
        return button
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
            playButton.image = UIImage(systemName: "play.fill")
        }
    }
    
    
    private func commonInit() {
        setupMediaImage()
        setUpPlayButton()
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
    
    private func setUpPlayButton() {
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        playButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
        playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor)
    
        ])
        }
    
    
}
