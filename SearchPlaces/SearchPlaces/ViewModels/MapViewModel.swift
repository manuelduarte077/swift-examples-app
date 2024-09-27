//
//  MapViewModel.swift
//  SearchPlaces
//
//  Created by Manuel Duarte on 26/9/24.
//

import Foundation
import Combine
import MapKit

class MapViewModel: ObservableObject {
    @Published var locations: [Location] = []
    @Published var favoriteLocations: [Location] = []
    private var locationService = LocationService()
    
    func searchLocations(query: String) {
        locationService.searchForPlace(query: query) { items in
            self.locations = items.map { item in
                Location(name: item.name ?? "Unknown", coordinate: item.placemark.coordinate)
            }
        }
    }
    
    func toggleFavorite(location: Location) {
        if let index = favoriteLocations.firstIndex(where: { $0.coordinate.latitude == location.coordinate.latitude && $0.coordinate.longitude == location.coordinate.longitude }) {
            favoriteLocations.remove(at: index)
        } else {
            favoriteLocations.append(location)
        }
    }
    
    func isFavorite(location: Location) -> Bool {
        return favoriteLocations.contains(where: { $0.coordinate.latitude == location.coordinate.latitude && $0.coordinate.longitude == location.coordinate.longitude })
    }
}
