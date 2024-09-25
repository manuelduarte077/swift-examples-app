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
            ContentView() // Reemplaza esto con tu vista principal
        } else {
            VStack {
                // Aquí puedes agregar tu logo o imagen de bienvenida
                Image("splash_logo") // Asegúrate de que la imagen esté en tus assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Ajusta el tamaño según tus necesidades
                
                Text("Dragon Ball")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // Animación o cualquier otro contenido que desees#imageLiteral(resourceName: "splash.png")
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
