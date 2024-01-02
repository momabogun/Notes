//
//  HomeView.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import SwiftUI

struct HomeView: View {
    @State var isOpened = false
    @State private var prio: Prio = Prio.low
    @ObservedObject var viewModel : TaskViewModel
    var body: some View {
        NavigationStack{
            VStack{
                
                Form{
                    Section{
                        List(viewModel.tasks.sorted(by: { $0.date ?? Date() > $1.date ?? Date() }), id: \.id){ task in
                            NavigationLink(destination: TaskScreen(task: task), label: {
                                TaskView(task: task)
                                    
                            }).padding(.trailing, -28.0)
                                .listRowBackground(
                                    Capsule()
                                        .fill(Color.white)
                                        .padding(2)
                                )
                            
                        }
                        
                    }
                }.navigationTitle("Notes")
                    .navigationBarTitleDisplayMode(.inline)
                
            }.scrollContentBackground(.hidden)
                .background{
                Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
                .searchable(text: $viewModel.search)
                .onChange(of: viewModel.search) {
                    viewModel.fetchSearchTasks()
                }
            
                .sheet(isPresented: $isOpened){
                NewNotesView(isOpened: $isOpened)
                    .environmentObject(viewModel)
                    .presentationDetents([.medium,.large])
                    
            }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isOpened.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                    ToolbarItem(placement: .topBarLeading) {
                        Menu("Filter Menu", systemImage: "line.3.horizontal.decrease.circle.fill") {
                            Section("Prio"){
                                ForEach(Prio.allCases, id: \.self ){ prio in
                                    Button(prio.title){
                                        viewModel.fetchSearchPrio(prio.rawValue)
                                    }
                                }
                            }
                            
                            Button("Reset Filters"){
                                viewModel.fetchTasks()
                            }
                        }
                }
                    
                    
                    
                    
                }
        }
    }
    
}


