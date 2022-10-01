//
//  ViewController.swift
//  MapKit-Starter
//
//  Created by 이태형 on 2022/09/26.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    //    private let mapView = MKMapView()
    
    //viewDIdLoad보다 먼저 불림
//    override func loadView() {
//        super.loadView()
//        view = mapView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(mapView)
//        mapView.frame = view.frame
        
        mapView.delegate = self
        locationManager.delegate = self
        
//        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        requestLocationAuthorization()
        fetchLocationOnMap(location: Stadium.stadiums)
    }

    @IBAction func didTapBtn(_ sender: UIButton) {
        centerLocation(location: Stadium.stadiums.last!)
    }
    
}

extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {return nil}
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
            annotationView?.clusteringIdentifier = "stadium"
            annotationView?.displayPriority = .required
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "poket_icon")
        annotationView?.frame.size = CGSize(width: 40, height: 40)
//        annotationView?.rightCalloutAccessoryView
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
    }
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        centerUserLocation(location: locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManager.requestLocation()
    }
}

extension ViewController{
    private func requestLocationAuthorization(){
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse,  .authorized:
            locationManager.requestLocation()
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        @unknown default:
            break
        }
    }
    
    private func centerUserLocation(location: [CLLocation]){
        guard let coordinate = location.last?.coordinate else{return}
        
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func fetchLocationOnMap(location: [LocationRepresentable]){
        for stadium in location {
            let annotation = MKPointAnnotation()
            annotation.title = stadium.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: stadium.latitude, longitude: stadium.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    private func centerLocation(location: LocationRepresentable){
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}
