//
//  ATM.swift
//  GPSB
//
//  Created by Bruno Scigliano on 5/19/18.
//  Copyright © 2018 UCU. All rights reserved.
//

import Foundation
import ObjectMapper

class ATM:Mappable {
    
    var accepts_deposits:Bool?
    var address:String?
    var has_money:Bool?
    var id:Int?
    var location:Location?
    var network:String?
    var status:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        accepts_deposits <- map["accepts_deposits"]
        address          <- map["address"]
        has_money        <- map["has_money"]
        id               <- map["id"]
        location         <- map["location"]
        network          <- map["network"]
        status           <- map["status"]
    }
    
}
