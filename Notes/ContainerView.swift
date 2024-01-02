//
//  ContainerView.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 28.12.23.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented = true
    var body: some View {
        if !isSplashScreenViewPresented {
            ContentView()
        } else {
            SplashScreenView(isPresented: $isSplashScreenViewPresented)
        }
    }
}

#Preview {
    ContainerView()
}
