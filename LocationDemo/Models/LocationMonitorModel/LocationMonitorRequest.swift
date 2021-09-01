//
//  LocationMonitorRequest.swift
//  LocationDemo
//
//  Created by admin on 02/09/21.
//

import Foundation

struct LocationMonitorRequest: Encodable {
    var userName : String?
    var location : Location2DCoordinate?
    var userExit : Bool?
    var regionIdentifier : String?
}

struct Location2DCoordinate:Encodable{
    var locationLatitude : Double?
    var locationLongitude : Double?
}
