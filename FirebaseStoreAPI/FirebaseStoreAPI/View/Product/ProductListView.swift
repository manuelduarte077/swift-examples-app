//
//  ProductListView.swift
//  FirebaseStoreAPI
//
//  Created by Manuel Duarte on 13/10/24.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchProducts()
            }
        }.navigationTitle("Products")
    }
}

#Preview {
    ProductListView()
}
