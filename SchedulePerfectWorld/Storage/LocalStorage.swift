//
//  CoreDataManager.swift
//  SchedulePerfectWorld
//
//  Created by Николай Щербаков on 09.06.2024.
//

import Foundation
import CoreData

final class LocalStorage {
    
    enum LocalStorageError: Error {
        case cannotGetPreferableEventsEntityFromLocalStorage
    }
    
    private let modelName = "PreferableEventsStorage"
    lazy var coreDataStack = CoreDataStack(modelName: modelName)
    
    func addPreferableEvent(desctiption: String) {
        do {
            if try !isPreferableEventsEntityExists() {
                let preferableEvents = PreferableEvents(context: coreDataStack.managedContext)
                preferableEvents.preferableEvents.append(desctiption as NSString)
                print("Added")
            } else {
                let preferableEvents = try coreDataStack.managedContext.fetch(PreferableEvents.fetchRequest()).first
                if preferableEvents != nil {
                    preferableEvents?.preferableEvents.append(desctiption as NSString)
                }
            }
            coreDataStack.saveContext()
        } catch let error as NSError {
            print("Error: \(error) description: \(error.userInfo) lel le le")
        }
    }
    
    func removePreferableEvent(by description: String) throws {
        let preferableEvents = try coreDataStack.managedContext.fetch(PreferableEvents.fetchRequest()).first ?? throwError(LocalStorageError.cannotGetPreferableEventsEntityFromLocalStorage)
        preferableEvents.preferableEvents.removeAll(where: {$0 == (description as NSString)})
        coreDataStack.saveContext()
    }
    
    func getPreferableEventsArray() throws -> [String] {
        let preferableEvents = try coreDataStack.managedContext.fetch(PreferableEvents.fetchRequest()).first ??
            throwError(LocalStorageError.cannotGetPreferableEventsEntityFromLocalStorage)
        return preferableEvents.preferableEvents as [String]
    }
    
    func isPreferableEventsEntityExists() throws -> Bool {
        try getCountOfPreferableEventsEntities() > 0
    }
    
    func getCountOfPreferableEventsEntities() throws -> Int {
        try coreDataStack.managedContext.fetch(PreferableEvents.fetchRequest()).count
    }
}
