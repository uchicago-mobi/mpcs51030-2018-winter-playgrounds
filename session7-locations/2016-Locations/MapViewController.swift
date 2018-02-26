//
//  MapViewController.swift
//  2016-Locations
//
//  Created by T. Andrew Binkowski on 2/22/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    /// Store local search results
    var matchingItems: [MKMapItem] = [MKMapItem]()
    
    /// The map view on the screen
    @IBOutlet weak var mapView: MKMapView! {
        didSet { mapView.delegate = self }
    }
    
    
    //
    // MARK: - Lifecycle
    //
    override func viewWillAppear(_ animated: Bool) {
        
        let miles: Double = 500 * 1600
        
        // Set a center point
        let zoomLocation = CLLocationCoordinate2DMake(-81.37944,28.53806)
        
        // Creat the region we want to see
        let viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, miles, miles)
        
        // Set the initial region on the map
        mapView.setRegion(viewRegion, animated: true)
        
        // Add points
        addDisneyWorld()
        addUChicago()
        
        // Set screen size
        showAllPoints()
    }
    
    
    //
    // MARK: - Annotations
    //
    
    /// Put Disney on the map
    func addDisneyWorld() {
        let coordinates = CLLocationCoordinate2DMake(28.53806, -81.37944)
        let annotation = MapAnnotation(title: "Disney World",
                                       subtitle: "Happiest Place on Earth", coordinate: coordinates)
        mapView.addAnnotation(annotation)
    }
    
    /// Put UChicago on the map
    func addUChicago() {
        let coordinates = CLLocationCoordinate2DMake(41.7897, -87.5997)
        let annotation = MapAnnotation(title: "The University of Chicago",
                                       subtitle: "2nd Happiest Place on Earth", coordinate: coordinates)
        mapView.addAnnotation(annotation)
    }
    
    /// Zoom the screen automatically to enclose the two annotations
    func showAllPoints() {
        let coordinates = CLLocationCoordinate2DMake(28.53806, -81.37944)
        let annotation = MapAnnotation(title: "Disney World", subtitle: "Happiest Place on Earth", coordinate: coordinates)
        
        let coordinates2 = CLLocationCoordinate2DMake(41.7897, -87.5997)
        let annotation2 = MapAnnotation(title: "The University of Chicago", subtitle: "2nd Happiest Place on Earth", coordinate: coordinates2)
        
        mapView.showAnnotations([annotation,annotation2], animated: true)
    }
    
    
    //
    // MARK: - Button Taps
    //
    
    ///
    /// Get directions to New York City
    /// - Parameters sender: The button that was tapped
    ///
    @IBAction func tapDirections(_ sender: UIBarButtonItem) {
        
        // Create request and set properties
        let request = MKDirectionsRequest()
        
        // Source location
        request.source = MKMapItem(placemark: MKPlacemark(coordinate:
            CLLocationCoordinate2D(latitude: 40.7127, longitude: -74.0059), addressDictionary: nil))
        
        // Destination location
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate:
            CLLocationCoordinate2D(latitude: 37.783333, longitude: -122.416667), addressDictionary: nil))
        
        // Specify the route type
        request.requestsAlternateRoutes = true
        request.transportType = .automobile
        
        // Request directions
        let directions = MKDirections(request: request)
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            // Create the overlay
            for route in unwrappedResponse.routes {
                self.mapView.add(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
            
            // Print turn-by-turn directions out to the console
            for step in (unwrappedResponse.routes.first?.steps)! as [MKRouteStep] {
                print(step.instructions)
            }
        }
    }
    
    ///
    /// Zoom the map to UChicago
    ///
    @IBAction func tapGoToSchool(_ sender: UIBarButtonItem) {
        let coordinates = CLLocationCoordinate2DMake(41.7897, -87.5997)
        let viewRegion = MKCoordinateRegionMakeWithDistance(coordinates, 1600*5, 1600*5)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    ///
    /// Execute a local search for pizza and show pins on the map
    ///
    @IBAction func tapSearchForPizza(_ sender: UIBarButtonItem) {
        
        // Set the region
        let coordinates = CLLocationCoordinate2DMake(41.7897, -87.5997)
        
        // Create the request
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Pizza"
        request.region = MKCoordinateRegionMakeWithDistance(coordinates, 1600*5, 1600*5)
        
        // Conduct the search
        MKLocalSearch(request: request).start { (response, error) in
            guard error == nil else { return }
            guard let response = response else { return }
            guard response.mapItems.count > 0 else { return }
            
            for item in response.mapItems {
                print("Name = \(item.name)")
                
                self.matchingItems.append(item as MKMapItem)
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    
}


///
/// MKMapView Delegate
///
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Tapped a callout")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapAnnotation {
            let identifier = "CustomPin"
            
            // Create a new view
            var view: MKMarkerAnnotationView
            
            // Deque an annotation view or create a new one
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                view.markerTintColor = .blue
                view.glyphText = "❤︎"
              
                // Add an image to the callout
                if annotation.title! == "Disney World" {
                    view.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "Mickey"))
                } else {
                    view.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "UChicago"))
                }
            }
            return view
        }
        return nil
    }
    
    // Draw the routing overlay
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        return renderer
    }
}

