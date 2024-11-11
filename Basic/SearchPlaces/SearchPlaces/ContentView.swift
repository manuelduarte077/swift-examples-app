//
//  ContentView.swift
//  SearchPlaces
//
//  Created by Manuel Duarte on 25/9/24.
//


import SwiftUI

extension Color {
    static let primaryColor = Color(#colorLiteral(red: 0.53, green: 0.73, blue: 0.68, alpha: 1))
    static let secondaryColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    static let favoriteColor = Color(#colorLiteral(red: 1, green: 0.84, blue: 0, alpha: 1))
}

struct ContentView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var showAlert = false
    
    var body: some View {
        TabView {
            MapView(viewModel: viewModel, showAlert: $showAlert)
                .tabItem {
                    Label("Mapa", systemImage: "map")
                }
            SearchView(viewModel: viewModel)
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }
            FavoriteLocationsView(viewModel: viewModel)
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                }
        }
    }
}
