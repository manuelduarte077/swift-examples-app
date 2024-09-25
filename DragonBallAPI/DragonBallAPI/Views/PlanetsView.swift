//
//  PlanetsView.swift
//  DragonBallAPI
//
//  Created by Manuel Duarte on 25/9/24.
//

import SwiftUI

struct PlanetsView: View {
    @StateObject private var planetsViewModel = PlanetViewModel()
    
    var body: some View {
        NavigationView {
            List(planetsViewModel.planets) { planet in
                NavigationLink(destination: PlanetsDetailView(planet: planet)){
                    AsyncImage(url: URL(string: planet.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 80)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .padding()
                            .frame(width: 100, height: 80)
                            .background(Color.gray.opacity(0.7))
                            .clipShape(Circle())
                    }
                    Text(planet.name)
                        .font(.title3)
                        .bold()
                    
                    Text(planet.isDestroyed ? "💥" : "🌎")
                }
            }
            .onAppear{
                planetsViewModel.fetchPlanets()
            }
            .navigationTitle("Planetas")
        }
    }
}

#Preview {
    PlanetsView()
}
