//
//  MediaObject+CoreDataProperties.swift
//  kidsCreative
//
//  Created by Amy Alsaydi on 4/14/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//
//

import Foundation
import CoreData


extension MediaObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MediaObject> {
        return NSFetchRequest<MediaObject>(entityName: "MediaObject")
    }

    @NSManaged public var activityName: String?
    @NSManaged public var createdDate: Date?
    @NSManaged public var id: String?
    @NSManaged public var videoData: Data?
    @NSManaged public var imageData: Data?

}
