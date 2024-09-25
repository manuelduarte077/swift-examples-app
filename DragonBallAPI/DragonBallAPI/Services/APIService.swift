//
//  APIService.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 24/9/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}
    
    // Base URL de la API
    private let baseURL = "https://dragonball-api.com/api"
    
    // Función para obtener la URL completa
    private func endpoint(for path: String) -> URL? {
        return URL(string: "\(baseURL)/\(path)")
    }
    
    /// fetchCharacters
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = endpoint(for: "characters") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characterResponse.items))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    /// fetchPlanets
    func fetchPlanets(completion: @escaping (Result<[Planet], Error>) -> Void) {
        guard let url = endpoint(for: "planets") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let planetResponse = try JSONDecoder().decode(PlanetResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(planetResponse.items))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
