//
//  ProductDetailView.swift
//  FirebaseStoreAPI
//
//  Created by Manuel Duarte on 13/10/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ProductDetailView: View {
    let product: Product
    @State private var isFavorite = false
    let db = Firestore.firestore()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            Text(product.title)
                .font(.title)
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.headline)
            
            Text(product.description)
                .padding()
            
            Button(action: {
                toggleFavorite()
            }, label: {
                Text(isFavorite ? "Remove from favorites" : "Add to favorites")
                    .padding()
                    .background(isFavorite ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .onAppear {
            checkIfFavorite()
        }
    }
    
    func toggleFavorite() {
        guard let user = Auth.auth().currentUser else { return }
        let userFavorites = db.collection("users").document(user.uid).collection("favorites")
        
        if isFavorite {
            userFavorites.document("\(product.id)").delete()
            isFavorite = false
        } else {
            let productData: [String: Any] = [
                "id": product.id,
                "title": product.title,
                "price": product.price,
                "description": product.description,
                "image": product.image
            ]
            userFavorites.document("\(product.id)").setData(productData)
            isFavorite = true
        }
    }
    
    func checkIfFavorite() {
        guard let user = Auth.auth().currentUser else { return }
        let userFavorites = db.collection("users").document(user.uid).collection("favorites")
        
        userFavorites.document("\(product.id)").getDocument { document, error in
            if let document = document, document.exists {
                isFavorite = true
            }
        }
    }
    
}

