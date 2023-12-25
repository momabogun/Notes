//
//  PersistentStore.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import Foundation
import CoreData

struct PersistentStore{
    
    static var shared = PersistentStore()
    
    private let myData : NSPersistentContainer
    var context : NSManagedObjectContext {
        myData.viewContext
    }
    
    init() {
        myData = NSPersistentContainer(name: "TasksData")
        context.automaticallyMergesChangesFromParent = true
        myData.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error loading Core Data: \(error), \(error.userInfo)")
            }
        }
    }
    
    func save() {
        guard context.hasChanges else{
            return
        }
        do {
            try context.save()
        } catch let error as NSError{
            NSLog("Unresolve error saving context: \(error), \(error.userInfo)")
        }
    }
    
    
    
}
