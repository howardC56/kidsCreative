//
//  DetailViewController.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    var imagePicker = UIImagePickerController()
    var activity: Activity?
    
    private lazy var imagePickerController: UIImagePickerController = {
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
        let pickerController = UIImagePickerController()
        pickerController.mediaTypes = mediaTypes ?? ["kUTTypeImage"]
        pickerController.delegate = self
        return pickerController
    }()
    
    private var mediaObjects = [MediaObject]() {
        didSet {
            detailView.collectionView.reloadData()
        }
    }
    
    
    override func loadView() {
        view = detailView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.collectionView.dataSource = self
        detailView.collectionView.delegate = self
        detailView.submitButton.addTarget(self, action: #selector(submitButtonPressed(_:)), for: .touchUpInside)
        detailView.collectionView.register(DetailCVCell.self, forCellWithReuseIdentifier: "detailCVC")
        view.backgroundColor = .white
        updateUI()
    }
    
    private func updateUI() {
        guard let activity = activity else { fatalError("No Activity") }
        detailView.activityTitle.text = activity.name
        detailView.activityDescription.text = activity.description
        detailView.getStarted.text = activity.directions

        // load media from core data
        do {
            mediaObjects = try CoreDataManager.shared.fetchMediaObjects()
        } catch {
            print("issue fetching media from core data \(error)")
        }
    }
    
    @objc func submitButtonPressed(_ sender: UIButton) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    
    private func playRandomVideo() {
        // we want all non-nill media objects from the media object array
        // compact map - it removes all non nill values
        let videoDataObject = mediaObjects.compactMap { $0.videoData }
        
        // get a random video URL
        if let videoObject = videoDataObject.randomElement(),
            let videoURL = videoObject.convertToURL() {
            let player = AVPlayer(url: videoURL)
            
            // create a sublayer
            let playerLayer = AVPlayerLayer(player: player)
            
            // set it's frame
            playerLayer.frame = view.bounds  // takes up the entire header view
            
            // set video aspect ratio
            playerLayer.videoGravity = .resizeAspect
            
            // remove all sublayers from headerView
            view.layer.sublayers?.removeAll()
            
            // add the playerLayer to the headerView's layer
            view.layer.addSublayer(playerLayer)
            
            // play video
            player.play()
        }
    }
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCVC", for: indexPath) as? DetailCVCell else {
            fatalError("could not dequeue a MediaCell")
        }
        let mediaObject = mediaObjects[indexPath.row]
        cell.configureCell(for: mediaObject)
        cell.backgroundColor = .white
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size // max width & height of current device
        let itemWidth: CGFloat = maxSize.width * 0.30
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}


extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String else {
            return
        }
        
        switch mediaType {
        case "public.image":
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let imageData = originalImage.jpegData(compressionQuality: 1.0) {
                
                do {
                    let mediaObject = try CoreDataManager.shared.createMediaObject(activityName: activity?.name ?? "No Activity Name", imageData: imageData, videoData: nil)
                    mediaObjects.append(mediaObject)
                } catch {
                    print("failed to created media object from image: \(error)")
                }
            }
            
        case "public.movie":
            if let mediaURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL, let image = mediaURL.videoPreviewThumbnail(), let imageData = image.jpegData(compressionQuality: 1.0) {
                
                var videoData: Data!
                do {
                    videoData = try Data(contentsOf: mediaURL)
                } catch {
                    print("failed to convert url to data with error: \(error)")
                }
                
                do {
                    let mediaObject = try CoreDataManager.shared.createMediaObject(activityName: activity?.name ?? "No Activity Name", imageData: imageData, videoData: videoData)
                    mediaObjects.append(mediaObject)
                    
                } catch {
                    print("failed to created media object from video: \(error)")
                }
            }
            
        default:
            print("Unsupported media typed")
        }
        
        picker.dismiss(animated: true)
    }
}

