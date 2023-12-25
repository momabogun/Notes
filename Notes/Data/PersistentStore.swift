//
//  PersistentStore.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import Foundation
import CoreData

struct PersistentStore{
    
    static let shared = PersistentStore()
    
    private let myData : NSPersistentContainer
   
    
    init() {
        myData = NSPersistentContainer(name: "TasksData")
        myData.viewContext.automaticallyMergesChangesFromParent = true
        myData.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error loading Core Data: \(error), \(error.userInfo)")
            }
        }
    }
    
    var context : NSManagedObjectContext {
        myData.viewContext
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
