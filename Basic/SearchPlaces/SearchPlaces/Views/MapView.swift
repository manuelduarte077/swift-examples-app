//
//  MapView.swift
//  SearchPlaces
//
//  Created by Manuel Duarte on 26/9/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: MapViewModel
    @Binding var showAlert: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        
        for location in viewModel.locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = location.coordinate
            uiView.addAnnotation(annotation)
        }
        
        if let firstLocation = viewModel.locations.first {
            let region = MKCoordinateRegion(center: firstLocation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            uiView.setRegion(region, animated: true)
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(viewModel: viewModel)
    }
}

class MapCoordinator: NSObject, MKMapViewDelegate {
    var viewModel: MapViewModel
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotationTitle = view.annotation?.title,
              let location = viewModel.locations.first(where: { $0.name == annotationTitle }) else { return }
        
        viewModel.toggleFavorite(location: location)
        
        // Mostrar alerta al marcar/desmarcar favorito
        let message = viewModel.isFavorite(location: location) ? "\(location.name) ha sido marcado como favorito." : "\(location.name) ha sido eliminado de favoritos."
        let alert = UIAlertController(title: "Información", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
            rootVC.present(alert, animated: true, completion: nil)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "location"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        if let title = annotation.title, let location = viewModel.locations.first(where: { $0.name == title }) {
            annotationView?.pinTintColor = viewModel.isFavorite(location: location) ? .red : .blue
        }
        
        return annotationView
    }
}
