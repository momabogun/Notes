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
    
    init(){
        fetchTasks()
    }
    
    
    func fetchTasks(){
        let request : NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try mydata.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    
    func saveTask(title: String, text: String, date: Date = Date()) {
        let newTask = Task(context: mydata.context)
        newTask.id = UUID()
        newTask.title = title
        newTask.text = text
        newTask.status = false
        mydata.save()
    }
    
    func updateTask(_ task: Task, with title: String){
        task.title = title
        mydata.save()
        fetchTasks()
    }
    
    func deleteTask(_ task: Task){
        mydata.context.delete(task)
        mydata.save()
        fetchTasks()
    }
    
    
    
}
