//
//  ContentView.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando productos...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible(), spacing: 16),
                                GridItem(.flexible(), spacing: 16)
                            ],
                            spacing: 16
                        ) {
                            ForEach(viewModel.products) { product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductCard(product: product)
                                        .frame(height: 220)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    }
                }
            }
            .navigationTitle("Productos")
            .onAppear {
                viewModel.loadProducts()
            }
        }
    }
}
