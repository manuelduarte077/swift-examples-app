//
//  LocationService.swift
//  SearchPlaces
//
//  Created by Manuel Duarte on 26/9/24.
//

import Foundation
import MapKit

class LocationService {

    func searchForPlace(query: String, completion: @escaping ([MKMapItem]) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 12.865416, longitude: -85.207229), latitudinalMeters: 300000, longitudinalMeters: 300000)
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let error = error {
                print("Error en la búsqueda: \(error)")
                completion([])
                return
            }
            completion(response?.mapItems ?? [])
        }
    }
}
