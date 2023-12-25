//
//  TaskScreen.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import SwiftUI

struct TaskScreen: View {
    @EnvironmentObject var viewModel: TaskViewModel
    @State private var isEditing = false
    @State private var selectedPriority: String = ""
    @State private var editedText = ""
    let task: Task
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                if isEditing {
                    TextField("Title", text: $editedText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Picker("Priority", selection: $selectedPriority) {
                        Text("Low").tag("low")
                        Text("Medium").tag("medium")
                        Text("High").tag("high")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                } 
                else{
                    
                    Text(task.text ?? "")
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Text("Priority: \(task.prio?.capitalized ?? "")")
                                .bold()
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundStyle(Prio(rawValue: task.prio ?? "low")?.color ?? .yellow)
                                .font(.title)
                        }
                        Spacer()
                    }
                }
                
            }.padding()
        }.navigationTitle(task.title ?? "")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if isEditing {
                            task.prio = selectedPriority
                            viewModel.updateTask(task, with: editedText)
                        }
                        isEditing.toggle()
                    }) {
                        if isEditing {
                            Text("Save")
                        } else {
                            Image(systemName: "square.and.pencil")
                        }
                    }
            }
                
            }
    }
}


