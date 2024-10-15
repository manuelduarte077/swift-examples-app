//
//  Product.swift
//  FirebaseStoreAPI
//
//  Created by Manuel Duarte on 13/10/24.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}
