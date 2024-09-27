//
//  FavoriteLocationsView.swift
//  SearchPlaces
//
//  Created by Manuel Duarte on 27/9/24.
//

import SwiftUI

struct FavoriteLocationsView: View {
    @ObservedObject var viewModel: MapViewModel

    var body: some View {
        NavigationView {
            List(viewModel.favoriteLocations, id: \.name) { location in
                NavigationLink(destination: LocationDetailView(location: location)) {
                    HStack {
                        Text(location.name)
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .navigationTitle("Favoritos")
            .onAppear {
            }
        }
    }
}
