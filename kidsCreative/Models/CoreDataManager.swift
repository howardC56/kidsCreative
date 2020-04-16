//
//  CoreDataManager.swift
//  kidsCreative
//
//  Created by Amy Alsaydi on 4/14/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    private init() {}
    static let shared = CoreDataManager()
    
    private var mediaObjects = [MediaObject]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
     func createMediaObject(activityName: String, imageData: Data, videoData: Data?) throws -> MediaObject {
        let mediaObject = MediaObject(entity: MediaObject.entity(), insertInto: context)
        
        mediaObject.activityName = activityName
        mediaObject.createdDate = Date()
        mediaObject.id = UUID().uuidString
        mediaObject.imageData = imageData
        
        // saving a video object
        if let videoData = videoData {
            mediaObject.videoData = videoData
        }
        
        do {
            try context.save()
        } catch {
            throw(error)
            // print("failed to save newly created media object with error: \(error)")
        }
        
        return mediaObject
        
    }
    
     func fetchMediaObjects() throws -> [MediaObject] {
        
        do {
            mediaObjects = try context.fetch(MediaObject.fetchRequest())
        } catch {
            throw(error)
            // print("error fetching media Objects ")
        }
        
        return mediaObjects
    }
}
