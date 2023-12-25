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
                        List(viewModel.tasks){ task in
                            Text(task.title!)
                            
                        }
                        
                        
                    }
                }
            }.sheet(isPresented: $isOpened){
                NewNotesView()
                    
            }.navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action performed when the button is tapped
                        isOpened.toggle()
                        print("Button tapped")
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
                    
                }
        }
    }
}


