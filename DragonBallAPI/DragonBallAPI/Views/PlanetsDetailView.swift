//
//  PlanetsDetailView.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import SwiftUI

struct PlanetsDetailView: View {
    var planet: Planet
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: planet.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                
                Text(planet.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                
                Text(planet.description)
                    .font(.body)
                    .foregroundColor(.primary)
                
            }
            .padding()
        }
        .navigationTitle("Detalles del Planeta")
        .navigationBarTitleDisplayMode(.inline)
    }
}
