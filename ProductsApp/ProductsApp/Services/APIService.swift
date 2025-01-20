//
//  APIService.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "La URL proporcionada es inválida."
        case .requestFailed:
            return "No se pudo conectar con el servidor."
        case .decodingFailed:
            return "Error al procesar los datos del servidor."
        }
    }
}

class APIService {
    static let shared = APIService()
    private init() {}
    
    func fetchProducts(completion: @escaping (Result<[Product], APIError>) -> Void) {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
}
