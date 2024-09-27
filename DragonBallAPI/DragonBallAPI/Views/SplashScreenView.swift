//
//  SplashScreenView.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("splash_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text("Dragon Ball")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
            .onAppear {
                // Esperar 2 segundos antes de cambiar a la vista principal
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
