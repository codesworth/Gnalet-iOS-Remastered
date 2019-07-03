//
//  LocationService.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 03/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import CoreLocation
import MaterialComponents
import GoogleMaps

protocol LocationServiceDelegate:class {
    func locationupdated(_ address:GMSAddress)
}

class LocationService:NSObject{
    
    fileprivate let manager = CLLocationManager()
    
    fileprivate var location:CLLocation?{
        didSet{
            guard let loca = location else {return}
            addressForLocation(coordinate: loca.coordinate)
        }
    }
    
    weak var delegate:LocationServiceDelegate?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            manager.startUpdatingLocation()
        }else{
          let alert = MDCAlertController(title: "INFO", message: "Please turn on location service for Gnalet to pick your location")
            let action = MDCAlertAction(title: "Cancel", handler: nil)
            let action2 = MDCAlertAction(title: "Settings", emphasis: .medium) { _ in
                //Opren Settings
            }
            alert.addAction(action)
            alert.addAction(action2)
            UIApplication.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func addressForLocation(coordinate:CLLocationCoordinate2D){
        
        GMSGeocoder().reverseGeocodeCoordinate(coordinate) { (response, err) in
            guard let address  = response?.firstResult() else {return}
            self.delegate?.locationupdated(address)
        }
    }
    
}


extension LocationService:CLLocationManagerDelegate{
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.location = location
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error occurred with location: \(error.localizedDescription)")
    }
}
