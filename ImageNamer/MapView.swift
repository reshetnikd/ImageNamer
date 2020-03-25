//
//  MapView.swift
//  BucketList
//
//  Created by Dmitry Reshetnik on 17.03.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
    
    var centerCoordinate: CLLocationCoordinate2D
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = centerCoordinate
        view.addAnnotation(annotation)
        let coordinate = annotation.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}
