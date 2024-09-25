//
//  CharacterViewModel.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 24/9/24.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var errorMessage: String? = nil

    func fetchCharacters() {
        APIService.shared.fetchCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
