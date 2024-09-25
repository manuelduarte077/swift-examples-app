//
//  FavoriteViewModel.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import Foundation
import SwiftData

@Observable
final class FavoriteViewModel: ObservableObject {
    let container = try! ModelContainer(for: Favorite.self)
    
    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }
    
    var favorites: [Favorite] = []
    
    @MainActor
    func getFavorites() {
        let fetchDescriptor = FetchDescriptor<Favorite>(predicate: nil, sortBy: [SortDescriptor<Favorite>(\.name)])
        do {
            favorites = try modelContext.fetch(fetchDescriptor)
            print(favorites)
        } catch {
            print("Error fetching favorites: \(error)")
        }
    }
    
    // Agregar a favoritos
    @MainActor
    func addFavorite(character: Character) {
        let favorite = Favorite(id: character.id, name: character.name, race: character.race, ki: character.ki)
        
        modelContext.insert(favorite)
        
        do {
            try modelContext.save()
            getFavorites() 
        } catch {
            print("Error saving favorite: \(error)")
        }
    }
}
