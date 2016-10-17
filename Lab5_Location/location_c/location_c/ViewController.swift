//
//  ViewController.swift
//  location_c
//
//  Created by Christina Nguyen on 10/4/16.
//  Copyright © 2016 Christina Nguyen. All rights reserved.
//
// Icon and launch screen image from: http://iconshow.me/media/images/ui/ios7-icons/png/512/location_1.png

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    var annotation = MKPointAnnotation()
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(manager.location!.coordinate, span)
        mapView.setRegion(region, animated: true)
        
        //annotations
        annotation.coordinate = manager.location!.coordinate
        annotation.title = "You are here"
        annotation.subtitle = "Latitude: \(manager.location!.coordinate.latitude), Longitude: \(manager.location!.coordinate.longitude)"
        mapView.addAnnotation(annotation)
    }
    
    //This function starts the location updating if it is authorized.
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    //This gets called when the location can't be determined.
    // Passing in an error as NSError (class in iOS that passes in errors).
    // We get the error code and set up an alert.
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        var errorType = String()
        if let clError = CLError(rawValue: error.code) {
            if clError == .Denied {
                errorType = "access denied"
                let alert = UIAlertController(title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction:UIAlertAction = UIAlertAction (title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        mapView.mapType = MKMapType.Hybrid //hybrid with map and satellite. Need to check up again on what MapTypes define.
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone //specify the distance a device has to move laterally (in meters) to generate an update. Why is it in meters? This specifies to be notified of all movements.
        mapView.showsUserLocation = true
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

