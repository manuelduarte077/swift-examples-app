//
//  ProductViewModel.swift
//  FirebaseStoreAPI
//
//  Created by Manuel Duarte on 13/10/24.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products = [Product]()
    
    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let products = try? decoder.decode([Product].self, from: data) {
                    DispatchQueue.main.sync {
                        self.products = products
                    }
                }
            }
        }.resume()
    }
}
