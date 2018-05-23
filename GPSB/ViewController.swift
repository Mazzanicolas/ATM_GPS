//
//  ViewController.swift
//  GPSB
//
//  Created by SP19 on 17/5/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController {

    let atm_url = "https://ucu-atm.herokuapp.com/api/atm"
    @IBOutlet var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        requestATMs(url:atm_url)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestATMs(url:String){
        Alamofire.request(url).responseArray{ (response: DataResponse<[ATM]>) in
            let atmsData = response.result.value
            if let atmsData = atmsData {
                for atm in atmsData {
                    self.addAnotation(atm: atm)
                }
            }
        }
    }
    
    func addAnotation(atm:ATM){
        let coords = CLLocationCoordinate2D(latitude:  (atm.location?.lat!)!, longitude: (atm.location?.lon!)!)//Fix
        let anno = CustomMarker(title: atm.address!, atm:atm, coordinate: coords)
        mapView.addAnnotation(anno)
    }
}
extension ViewController: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? CustomMarker else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
