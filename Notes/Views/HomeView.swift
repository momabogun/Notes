//
//  HomeView.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import SwiftUI

struct HomeView: View {
    @State var isOpened = false
    @ObservedObject var viewModel : TaskViewModel
    var body: some View {
        NavigationStack{
            VStack{
                
                Form{
                    Section("Tasks"){
                        List(viewModel.tasks, id: \.id){ task in
                            NavigationLink(destination: TaskScreen(task: task)){
                                TaskView(task: task)
                            }
                        }
                        
                        
                        
                    }
                }
            }.sheet(isPresented: $isOpened){
                NewNotesView(isOpened: $isOpened)
                    .presentationDetents([.medium,.large])
                    
            }.navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isOpened.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
                    
                }
        }
    }
    
}


