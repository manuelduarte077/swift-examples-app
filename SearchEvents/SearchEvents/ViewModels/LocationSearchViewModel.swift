//
//  LocationSearchViewModel.swift
//  SearchEvents
//
//  Created by Manuel Duarte on 27/9/24.
//

import Foundation
import Combine
import MapKit

class LocationSearchViewModel: ObservableObject {
    @Published var searchResults: [MKMapItem] = []
    
    func searchPlaces(query: String, completion: @escaping () -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let error = error {
                print("Error searching places: \(error.localizedDescription)")
                return
            }
            guard let response = response else { return }
            self.searchResults = response.mapItems
            completion()
        }
    }
}
