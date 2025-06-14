//
//  ProductRow.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack {
            if let imageUrl = product.images.first, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.green)
                Text(product.category.name)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
