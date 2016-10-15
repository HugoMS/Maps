//
//  ViewController.swift
//  Maps
//
//  Created by Hugo Morelli on 10/4/16.
//  Copyright © 2016 Hugo Morelli. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    //MARK : Properties
    @IBOutlet weak var map: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let latitude :  CLLocationDegrees =  10.5
        
        let longitude: CLLocationDegrees = -66.9
        
        let latDelta: CLLocationDegrees = 0.05
        
        let longDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion =  MKCoordinateRegion(center: coordinates  , span: span)
        
        map.setRegion(region, animated: true )
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Caracas"
        
        annotation.subtitle = "I love Caracas"
        
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer){
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New place"
        
        annotation.subtitle = "Maybe I'll go here too..."
        
        map.addAnnotation(annotation)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

