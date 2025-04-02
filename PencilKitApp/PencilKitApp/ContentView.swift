//
//  ContentView.swift
//  PencilKitApp
//
//  Created by Manuel Duarte on 2/4/25.
//

import SwiftUI
import PencilKit // Importa también aquí si usas PKDrawing

struct ContentView: View {
    // Estado para controlar si el Canvas ha aparecido
    @State private var canvasHasAppeared = false
    // (Opcional) Estado para almacenar el dibujo
    // @State private var currentDrawing = PKDrawing()

    var body: some View {
        NavigationView {
            VStack {
                Text("Lienzo con ToolPicker")
                    .font(.headline)
                    .padding(.top)

                CanvasViewRepresentable(
                    hasAppeared: $canvasHasAppeared
                    // , drawing: $currentDrawing // Pasa el binding del dibujo si lo usas
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color.gray, width: 1)
                .padding()
                // El modificador onAppear actualiza el estado cuando la vista aparece
                .onAppear {
                    print("ContentView: CanvasViewRepresentable onAppear triggered.") // Log
                    self.canvasHasAppeared = true
                }
                // Opcional: Resetea el estado si la vista puede desaparecer y reaparecer
                // .onDisappear {
                //     self.canvasHasAppeared = false
                // }
                
                

            }
            .navigationTitle("Dibujo")
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
