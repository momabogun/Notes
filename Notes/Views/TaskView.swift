//
//  TaskView.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var viewModel : TaskViewModel
    let task : Task
    var body: some View {
        HStack{
            
            VStack{
                HStack{
                    Text(task.title ?? "")
                    
                        .font(.headline)
                        .bold()
                    Spacer()
                }
                HStack{
                    Text(formatDate(date: task.date ?? Date()))
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Text((task.text?.prefix(11) ?? "") + (task.text?.count ?? 0 > 11 ? "..." : ""))
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Spacer()
                }
            }.swipeActions {
                Button(role: .destructive) {
                    viewModel.deleteTask(task)
                } label: {
                    Label("Delete", systemImage: "trash.circle.fill")
                }
            }
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(Prio(rawValue: task.prio ?? "low")?.color ?? .yellow)
                
        }
        
    }
    
    func formatDate(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm" // Customize the format as needed
            return dateFormatter.string(from: date)
        }
}


