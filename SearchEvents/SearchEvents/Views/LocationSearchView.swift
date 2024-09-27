//
//  LocationSearchView.swift
//  SearchEvents
//
//  Created by Manuel Duarte on 27/9/24.
//

import SwiftUI
import MapKit

extension MKMapItem: Identifiable {
    public var id: String {
        return self.placemark.coordinate.latitude.description + self.placemark.coordinate.longitude.description
    }
}

struct LocationSearchView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = LocationSearchViewModel()
    @State private var selectedPlace: MKMapItem?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar lugares...", text: $searchText, onCommit: {
                    viewModel.searchPlaces(query: searchText) {
                        // Acciones después de la búsqueda
                    }
                })
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                
                List(viewModel.searchResults, id: \.self) { item in
                    Button(action: {
                        selectedPlace = item
                    }) {
                        Text(item.name ?? "Sin nombre")
                    }
                }
            }
            .navigationTitle("Buscar Lugares")
            .sheet(item: $selectedPlace) { place in
                PlaceDetailView(place: place)
            }
        }
    }
}

#Preview {
    LocationSearchView()
}
