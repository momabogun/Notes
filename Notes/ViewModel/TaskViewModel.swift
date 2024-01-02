//
//  TaskViewModel.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import Foundation
import CoreData
class TaskViewModel: ObservableObject{
    
    
    init(){
        fetchTasks()
    }
    
    
    @Published var tasks : [Task] = []
    
    @Published var search = ""
    
    let mydata = PersistentStore.shared

    
   
    
    
    func fetchTasks(){
        let request = NSFetchRequest<Task>(entityName: "Task")
        
        do {
            tasks = try mydata.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    
    func fetchSearchTasks(){
        guard !search.isEmpty else{
            fetchTasks()
            return
        }
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", search)
        
        do {
            tasks = try mydata.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    
    func fetchSearchPrio(_ prio: String){
       
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(format: "prio == %@", prio)
        
        do {
            tasks = try mydata.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    
    func saveTask(title: String, text: String, prio: Prio.RawValue) {
        let newTask = Task(context: mydata.context)
        newTask.id = UUID()
        newTask.title = title
        newTask.text = text
        newTask.status = false
        newTask.date = Date()
        newTask.prio = prio
        mydata.save()
        fetchTasks()
    }
    
    func updateTask(_ task: Task, with text: String, with prio: String){
        task.text = text
        task.prio = prio
        task.date = Date()
        mydata.save()
        fetchTasks()
    }
    
    func deleteTask(_ task: Task){
        mydata.context.delete(task)
        mydata.save()
        fetchTasks()
    }
    
    
    
}
