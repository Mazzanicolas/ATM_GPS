//
//  Location.swift
//  GPSB
//
//  Created by Bruno Scigliano on 5/19/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import Foundation
import ObjectMapper

class Location:Mappable {
    
    var lat:Double?
    var lon:Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
    
}

