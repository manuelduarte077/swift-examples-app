//
//  LocationDetailView.swift
//  SearchPlaces
//
//  Created by Manuel Duarte on 27/9/24.
//

import SwiftUI

struct LocationDetailView: View {
    var location: Location

    var body: some View {
        VStack {
            Text(location.name)
                .font(.largeTitle)
                .padding()

            Text("Coordenadas: \(location.coordinate.latitude), \(location.coordinate.longitude)")
                .padding()

            Spacer()
        }
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
