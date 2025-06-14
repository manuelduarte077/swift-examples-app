//
//  ProductDetailView.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var isAddedToCart = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Carrusel de imágenes
                ImageCarouselView(images: product.images)
                
                // Información del producto
                VStack(alignment: .leading, spacing: 16) {
                    Text(product.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title2)
                        .foregroundColor(.green)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    // Botón agregar al carrito
                    Button(action: {
                        isAddedToCart.toggle()
                    }) {
                        Text(isAddedToCart ? "Agregado al carrito" : "Agregar al carrito")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isAddedToCart ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Detalle del Producto")
        .navigationBarTitleDisplayMode(.inline)
    }
}

