//
//  ImageCarouselView.swift
//  ProductsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

import SwiftUI

struct ImageCarouselView: View {
    let images: [String]
    @State private var selectedImageIndex = 0
    
    var body: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(images.indices, id: \.self) { index in
                if let url = URL(string: images[index]) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 300)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
    }
}
