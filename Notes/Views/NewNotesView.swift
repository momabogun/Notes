//
//  NewNotesView.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import SwiftUI

struct NewNotesView: View {
    @EnvironmentObject var viewModel: TaskViewModel
    @State var title : String = ""
    @State var text: String = ""
    @State var prio: Prio = Prio.low
    @Binding var isOpened: Bool
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section("Title"){
                        TextField("Title", text: $title)
                    }
                    Section("Text"){
                        TextEditor(text: $text)
                                        .frame(maxHeight: .infinity)
                            
                        
                    }
                    Section("Priority of task"){
                            Picker("Priority: ", selection: $prio){
                                ForEach(Prio.allCases, id: \.self){ prio in
                                    Text(prio.rawValue.capitalized)
                                }
                            }
                        }
                }
            }.navigationTitle("New Notes").navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.saveTask(title: title, text: text, prio: prio.rawValue)
                        isOpened.toggle()
                    }) {
                        Text("Done")
                    }.disabled(title.isEmpty)
                }
                    
                }
        }
    }
}

