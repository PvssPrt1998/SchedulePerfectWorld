//
//  PreferableEvents+CoreDataProperties.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 09.06.2024.
//
//

import Foundation
import CoreData


extension PreferableEvents {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PreferableEvents> {
        return NSFetchRequest<PreferableEvents>(entityName: "PreferableEvents")
    }

    @NSManaged public var preferableEvents: [NSString]

}

extension PreferableEvents : Identifiable {

}
