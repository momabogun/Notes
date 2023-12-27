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
    @State var prio: Prio
    @State private var editedText :String
    let task: Task
    
    init(task: Task) {
            self.task = task
            _editedText = State(initialValue: task.text ?? "")
        _prio = State(initialValue: Prio(rawValue: task.prio ?? "low") ?? .low)
        }

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                if isEditing {
                    
                    TextEditor(text: $editedText)
                                        .frame(maxHeight: .infinity)
                    
                        
                    Form{
                        Section("Priority"){
                            Picker("Priority: ", selection: $prio){
                                ForEach(Prio.allCases, id: \.self){ prio in
                                    Text(prio.rawValue.capitalized)
                                }
                                
                            }.pickerStyle(WheelPickerStyle())
                        }
                    }
                        
                    
                    
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
                            viewModel.updateTask(task, with: editedText, with: prio.rawValue)
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


