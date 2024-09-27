//
//  CharacterDetailView.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 24/9/24.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    @StateObject private var favoriteViewModel = FavoriteViewModel()
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }

                Text(character.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)

                Text("Raza: \(character.race)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Ki: \(character.ki) 💥")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Affiliation: \(character.affiliation)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(character.description)
                    .font(.body)
                    .foregroundColor(.primary)
                
                // Botón para agregar a favoritos
                Button(action: {
                    if isFavorite {
                        isFavorite = false
                    } else {
                        favoriteViewModel.addFavorite(character: character)
                        isFavorite = true
                    }
                }) {
                    Text(isFavorite ? "Remover de Favoritos" : "Agregar a Favoritos")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Detalles del Personaje")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            isFavorite = favoriteViewModel.favorites.contains(where: { $0.id == character.id })
        }
    }
}
