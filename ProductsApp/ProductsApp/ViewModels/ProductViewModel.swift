//
//  ProductViewModel.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
        
    // Fetch Product
    func loadProducts() {
        isLoading = true
        APIService.shared.fetchProducts { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    // Fetch Product by Id
    func loadProduct(id: Int) -> Product? {
        return products.first(where: { $0.id == id })
    }
    
}
