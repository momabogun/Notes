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
                }
            }.navigationTitle("New Notes").navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.saveTask(title: title, text: text)
                    }) {
                        Text("Done")
                    }
                }
                    
                }
        }
    }
}

