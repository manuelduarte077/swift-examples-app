//
//  ProductCard.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            if let imageUrl = product.images.first, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 120)
                            .clipped()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            Text(product.title)
                .font(.headline)
                .lineLimit(2)
                .padding(.vertical, 2)
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}
