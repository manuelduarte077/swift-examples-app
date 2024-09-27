//
//  SearchView.swift
//  SearchPlaces
//
//  Created by Manuel Duarte on 26/9/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: MapViewModel
    @State private var searchQuery: String = ""
    @State private var showAlert = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            TextField("Buscar lugar", text: $searchQuery, onCommit: {
                viewModel.searchLocations(query: searchQuery)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            List(viewModel.locations, id: \.name) { location in
                HStack {
                    Text(location.name)
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Button(action: {
                        viewModel.toggleFavorite(location: location)
                        // Configurar el mensaje de alerta
                        alertMessage = viewModel.isFavorite(location: location) ? "\(location.name) ha sido marcado como favorito." : "\(location.name) ha sido eliminado de favoritos."
                        showAlert = true // Mostrar alerta
                    }) {
                        Image(systemName: viewModel.isFavorite(location: location) ? "star.fill" : "star")
                            .foregroundColor(viewModel.isFavorite(location: location) ? .favoriteColor : .gray)
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Información"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Buscar")
    }
}
