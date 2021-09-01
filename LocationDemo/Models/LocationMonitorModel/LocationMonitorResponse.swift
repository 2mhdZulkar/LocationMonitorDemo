//
//  LocationMonitorResponse.swift
//  LocationDemo
//
//  Created by admin on 02/09/21.
//

import Foundation

struct LocationMonitorResponse : Decodable {
    
    let error : String?
    let data : LocationMonitorResponseData?
}

struct LocationMonitorResponseData : Decodable  {
    let success: Bool
}
