//
//  LocationResource.swift
//  LocationDemo
//
//  Created by admin on 02/09/21.
//

import Foundation

struct LocationResource {
    
    func userLocationUpdate(locationMonitorRequest:LocationMonitorRequest,completionHandler : @escaping (_ result : LocationMonitorResponse) -> Void )
    {
        let updateLocationUrl = URL(string: ApiEndpoints.updateLocation)!
        let httpUtilty = HttpUtility()
        
        do {
            let locationMonitorPostBody = try JSONEncoder().encode(locationMonitorRequest)
            
            httpUtilty.postApiData(requestUrl: updateLocationUrl, httpBody: locationMonitorPostBody, requestType: LocationMonitorResponse.self) { (locationMonitorResponse) in
                _ = completionHandler(locationMonitorResponse)
            }
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        
        
    }
    
    func userLocationUpdateFake(locationMonitorRequest:LocationMonitorRequest,completionHandler : @escaping (_ result : LocationMonitorResponse) -> Void )
    {
        let locationMonitorResponse = LocationMonitorResponse(error: nil, data: LocationMonitorResponseData(success: true))
        sleep(5)
        completionHandler(locationMonitorResponse)
    }
}
