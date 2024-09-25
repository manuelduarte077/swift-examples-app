//
//  FavoriteViewModel.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import Foundation

class PlanetViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @Published var errorMessage: String? = nil
    
    func fetchPlanets() {
        APIService.shared.fetchPlanets { [weak self] result in
            switch result {
            case .success(let planets):
                self?.planets = planets
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
