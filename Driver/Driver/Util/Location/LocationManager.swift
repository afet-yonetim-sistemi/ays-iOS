//
//  LocationManager.swift
//  Driver
//
//  Created by Tolga Taner on 4.03.2023.
//

import Foundation
import CoreLocation
import MapKit

protocol LocationManagerDelegate: AnyObject {
    var userCoordinateRegion: MKCoordinateRegion? { get set }
    
    func locationAccessStatusDidChanged(_ status: LocationManager.Status)
    func centerUserLocation(_ region: MKCoordinateRegion)
}

final class LocationManager: NSObject {
    
    var manager: CLLocationManager
    weak var delegate: LocationManagerDelegate?
    var userCoordinate: CLLocationCoordinate2D?
    
    private struct Constants {
        static let latitudeDelta: CGFloat = 0.1
        static let longitudeDelta: CGFloat = 0.3
    }
    
    enum Status {
        case access
        case denied
    }
    
    init(manager: CLLocationManager = CLLocationManager(),
         userCoordinate: CLLocationCoordinate2D? = nil,
         delegate: LocationManagerDelegate) {
        self.delegate = delegate
        self.manager = manager
        self.userCoordinate = userCoordinate
        super.init()
        setup()
    }
    
    //https://stackoverflow.com/questions/34527972/location-update-even-when-app-is-killed-terminated
}
//MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let authorizationStatus: CLAuthorizationStatus
        if #available(iOS 14, *) {
            authorizationStatus = manager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        switch authorizationStatus {
        case .notDetermined:
            manager.requestAlwaysAuthorization()
        case .restricted:
            delegate?.locationAccessStatusDidChanged(.denied)
        case .denied:
            delegate?.locationAccessStatusDidChanged(.denied)
        case .authorizedAlways:
            delegate?.locationAccessStatusDidChanged(.access)
        case .authorizedWhenInUse:
            delegate?.locationAccessStatusDidChanged(.access)
        @unknown default:
            delegate?.locationAccessStatusDidChanged(.denied)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            userCoordinate = location.coordinate
            userLocationDidChanged(location)
        }
    }
}
//MARK: - LocationProtocol
extension LocationManager: LocationProtocol {
    func setup() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.allowsBackgroundLocationUpdates = true
        manager.requestAlwaysAuthorization()
        #warning("consider pausesLocationUpdatesAutomatically")
    }
    
    func startLocationTracking() {
        manager.startUpdatingLocation()
        manager.startMonitoringSignificantLocationChanges()
    }
    
    func stopLocationTracking() {
        manager.stopUpdatingLocation()
        manager.stopMonitoringSignificantLocationChanges()
    }
    
    func userLocationDidChanged(_ location: CLLocation) {
        let coordinateRegion: MKCoordinateRegion = getCoordinateRegion(fromLocation: location, latitudeDelta: Constants.latitudeDelta, longitudeDelta: Constants.longitudeDelta)
        delegate?.centerUserLocation(coordinateRegion)
    }
}

