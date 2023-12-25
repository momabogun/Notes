//
//  TaskViewModel.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import Foundation
import CoreData
class TaskViewModel: ObservableObject{
    @Published var tasks : [Task] = []
    
    let mydata = PersistentStore.shared
    
    
    
    private func fetchTasks(){
        let request : NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try mydata.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    
    private func addTask(title: String, text: String, status: Bool = false, date: Date = Date(),)
    
}
