//
//  PlaceDetailView.swift
//  SearchEvents
//
//  Created by Manuel Duarte on 27/9/24.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    var place: MKMapItem
    
    var body: some View {
        ScrollView {
            VStack {
                Text(place.name ?? "Sin nombre")
                    .font(.largeTitle)
                    .padding()
                
                Text(place.placemark.title ?? "Sin dirección")
                    .padding()
                
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: place.placemark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))),
                    interactionModes: .all)
                .frame(height: 300)
                .padding()
                
                if let phoneNumber = place.phoneNumber {
                    Text("Teléfono: \(phoneNumber)")
                }
                if let url = place.url {
                    Link("Visitar sitio web", destination: url)
                }
            }
            .padding()
        }
        .navigationTitle("Detalles del Lugar")
    }
}
