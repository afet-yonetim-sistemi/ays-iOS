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

/// This is a manager class to track user location.
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
    
    #warning("Tolga:Consider pausesLocationUpdatesAutomatically")
    //https://stackoverflow.com/questions/34527972/location-update-even-when-app-is-killed-terminated
}
//MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    /**
     When the location of user authorization did changed by the user, this method is triggered.
     ## Important Notes ##
     There are two types authorization status. These are denied and access. It sends one of them as the delegation pattern.
     - parameters:
     - manager: CLLocationManager
     */
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
 
    /**
     It triggers when the location is updated.
     ## Important Notes ##
     It calls userLocationDidChanged(location) method to send the latest location which is a delegation.
     - parameters:
     - manager: CLLocationManager
     - manager: [CLLocation]
     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            userCoordinate = location.coordinate
            userLocationDidChanged(location)
        }
    }
}
//MARK: - LocationTrackable
extension LocationManager: LocationTrackable {
    /**
     It setups location configurations such as requesting the authorization, desired accuracy etc.
     - parameters: nil
     */
    func setup() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.allowsBackgroundLocationUpdates = true
        manager.requestAlwaysAuthorization()
        #warning("Tolga:Consider startMonitoringSignificantLocationChanges() and requestAlwaysAuthorization() how both works together or do we need to seperate them?.")
        #warning("Tolga:Consider pausesLocationUpdatesAutomatically")
    }
    /**
     It starts location tracking both monitoringSignificantLocationChanges and updatingLocation.
     - parameters: nil
     */
    func startLocationTracking() {
        manager.startUpdatingLocation()
        manager.startMonitoringSignificantLocationChanges()
    }
    /**
     It stops location tracking both monitoringSignificantLocationChanges and updatingLocation.
     - parameters: nil
     */
    func stopLocationTracking() {
        manager.stopUpdatingLocation()
        manager.stopMonitoringSignificantLocationChanges()
    }
    /**
     It sends location when the changing occurs.
     - parameters: nil
     */
    func userLocationDidChanged(_ location: CLLocation) {
        let coordinateRegion: MKCoordinateRegion = getCoordinateRegion(fromLocation: location, latitudeDelta: Constants.latitudeDelta, longitudeDelta: Constants.longitudeDelta)
        delegate?.centerUserLocation(coordinateRegion)
    }
}

