//
//  Product.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import Foundation

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let images: [String]
    let category: Category
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let image: String
}

