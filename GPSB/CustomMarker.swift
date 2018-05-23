//
//  CustomMarker.swift
//  GPSB
//
//  Created by Bruno Scigliano on 5/19/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import MapKit

class CustomMarker: NSObject, MKAnnotation {
    let title: String?
    let atm: ATM
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, atm:ATM, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.atm = atm
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        let hasMoney:String
        let acceptDeposit:String
        if atm.has_money! {
            hasMoney = "💵"
        } else {
            hasMoney = "💸"
        }
        if atm.accepts_deposits! {
            acceptDeposit = "🦄"
        } else {
            acceptDeposit = "🐴"
        }
        return hasMoney + acceptDeposit
    }
}
