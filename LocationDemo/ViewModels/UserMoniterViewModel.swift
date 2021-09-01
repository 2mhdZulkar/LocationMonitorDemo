//
//  UserMoniterViewModel.swift
//  LocationDemo
//
//  Created by admin on 02/09/21.
//

import Foundation

protocol UserMoniteriewModelDelegate {
    func didReceviveResponse(locationMonitorResponse: LocationMonitorResponse?)
}

class UserMoniterViewModel {
    
    var userMoniterViewModelDelegate: UserMoniteriewModelDelegate?
    func updateUserLocation(locationMonitorRequest: LocationMonitorRequest)
    {
        
        LocationResource().userLocationUpdateFake(locationMonitorRequest: locationMonitorRequest) { locationMonitorResponse in
            
            self.userMoniterViewModelDelegate?.didReceviveResponse(locationMonitorResponse: locationMonitorResponse)
        }
    }
    
}
