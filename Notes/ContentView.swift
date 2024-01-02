//
//  ContentView.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 24.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    var body: some View {
            HomeView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
