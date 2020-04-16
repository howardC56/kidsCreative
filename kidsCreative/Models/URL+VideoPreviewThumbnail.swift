//
//  URL+VideoPreviewThumbnail.swift
//  kidsCreative
//
//  Created by David Lin on 4/16/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import AVFoundation


extension URL {
    
    public func videoPreviewThumbnail() -> UIImage? {
        
        // create an AVAsset instance
        // e.g. mediaObject.videoURL
        let asset = AVAsset(url: self) // self is the URL instance
        
        // The AVAssetImageGenerator is an AVFoundation class that converts a given media url to an image
        let assetGenerator = AVAssetImageGenerator(asset: asset)
        
        // we want to maintain the aspect ration of the video
        assetGenerator.appliesPreferredTrackTransform = true
        
        // create a time stamp of needed location in the video
        // we will use a CMT to generate the given time stamp
        // CMTTime is part of Core Media
        let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
        // retrieve the first seconf of the video
        
        var image: UIImage?
        
        do {
            let cgImage = try assetGenerator.copyCGImage(at: timestamp, actualTime: nil)
            image = UIImage(cgImage: cgImage)
            
            // lower level API don't know about UIKit, AVKit \
            // changee the color of a UIView border
            // e.g. someView.layer.borderColor = UIColor.green.cgColor
        } catch {
            print("failed to ")
        }
        return image
    }
    
}
