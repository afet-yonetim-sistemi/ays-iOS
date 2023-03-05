//
//  LocationProtocol.swift
//  Driver
//
//  Created by Tolga Taner on 4.03.2023.
//

import Foundation
import CoreLocation
import MapKit

protocol UserLocationProtocol: AnyObject {
    var userCoordinate: CLLocationCoordinate2D? { get set }
}
protocol LocationProtocol: UserLocationProtocol {
    var manager: CLLocationManager { get }
    var delegate: LocationManagerDelegate? { get }
    
    func setup()
    func startLocationTracking()
    func stopLocationTracking()
    func startMonitoringSignificantLocationChanges()
    func userLocationDidChanged(_ location: CLLocation)
    func getCoordinateRegion(fromLocation location: CLLocation,
                             latitudeDelta: CGFloat,
                             longitudeDelta: CGFloat) -> MKCoordinateRegion
    func distanceBetween(fromFirstCoordinate firstCoordinate: CLLocationCoordinate2D,
                         toSecondCoordinate secondCoordinate: CLLocationCoordinate2D) -> Measurement<UnitLength>
    func getCoordinateRegion(fromCoordinate coordinate: CLLocationCoordinate2D,
                             latitudeDelta: CGFloat,
                             longitudeDelta: CGFloat) -> MKCoordinateRegion
}
//MARK: - LocationProtocol
extension LocationProtocol {
    func getCoordinateRegion(fromLocation location: CLLocation,
                             latitudeDelta: CGFloat,
                             longitudeDelta: CGFloat) -> MKCoordinateRegion {
        let userCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(center: userCoordinate, span: span)
        self.userCoordinate = userCoordinate
        return coordinateRegion
    }
    
    func getCoordinateRegion(fromCoordinate coordinate: CLLocationCoordinate2D,
                             latitudeDelta: CGFloat,
                             longitudeDelta: CGFloat) -> MKCoordinateRegion {
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        return coordinateRegion
    }
    
    func distanceBetween(fromFirstCoordinate firstCoordinate: CLLocationCoordinate2D, toSecondCoordinate secondCoordinate: CLLocationCoordinate2D) -> Measurement<UnitLength> {
        let firstLocation = CLLocation(latitude: firstCoordinate.latitude, longitude: firstCoordinate.longitude)
        let secondLocation = CLLocation(latitude: secondCoordinate.latitude, longitude: secondCoordinate.longitude)
        let distance = firstLocation.distance(from: secondLocation)
        let distanceInMeters = Measurement(value: distance, unit: UnitLength.meters)
        return distanceInMeters
    }
}
