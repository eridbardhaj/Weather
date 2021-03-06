//
//  LocationManager.swift
//  Weather
//
//  Created by Erid Bardhaj on 5/2/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate
{
    //Vars
    private var locationManager = CLLocationManager()
    
    var m_currentLat: Double = 0.0
    var m_currentLng: Double = 0.0
    
    
    //Singleton pattern
    class var shared: LocationManager
    {
        struct Static
        {
            static var onceToken: dispatch_once_t = 0
            static var instance: LocationManager? = nil
        }
        
        dispatch_once(&Static.onceToken)
        {
            Static.instance = LocationManager()
            Static.instance?.startTrackingLocation()
        }
        return Static.instance!
    }

    //MARK: - Setups    
    private func startTrackingLocation()
    {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    /**
        Reactivates searching places to get new coordinates
    */
    func getCurrentLocation()
    {
        self.locationManager.startUpdatingLocation()
    }
    
    
    //MARK: - CLLocationManagerDelegate Methods
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!)
    {
        //Get data from the locationManager
        let lat: Double? = self.locationManager.location.coordinate.latitude
        let lng: Double? = self.locationManager.location.coordinate.longitude
        
        //Store to DataManager
        DataManager.shared.m_city_lat = lat!
        DataManager.shared.m_city_lng = lng!
        
        //Update the new weather
        NSNotificationCenter.defaultCenter().postNotificationName(ObserverType.LocationFound.description, object: nil)
        
        //Stop location manager
        locationManager.stopUpdatingLocation() //To save battery
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!)
    {
        println("Error: " + error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        switch status
        {
        case .Denied:
            println("Denied")
            break
            
        case .NotDetermined:
            println("Not determined")
            break
            
        case .AuthorizedAlways:
            LocationManager.shared.getCurrentLocation()
            break
            
        case .AuthorizedWhenInUse:
            LocationManager.shared.getCurrentLocation()
            break
            
        default:
            break
        }
    }
}
