//
//  UserMonitorViewController.swift
//  LocationDemo
//
//  Created by admin on 02/09/21.
//

import UIKit
import CoreLocation

class UserMonitorViewController: UIViewController {

    private var userMoniterViewModel = UserMoniterViewModel()
    private let locationManger:CLLocationManager = CLLocationManager()
    private var userLocation: CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userMoniterViewModel.userMoniterViewModelDelegate = self
        self.setupLocationManger()
        // Do any additional setup after loading the view.
    }
    

    func setupLocationManger()  {
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        locationManger.distanceFilter = 100
        
        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), radius: 100, identifier: "MonitorGeofenceCircular")
        
        locationManger.startMonitoring(for: geoFenceRegion)
        
    }

}
extension UserMonitorViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.userLocation = locations.last?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        self.updateLocation(regionIdentifier: region.identifier, userExit: false)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        self.updateLocation(regionIdentifier: region.identifier, userExit: true)
    }
    
    func updateLocation(regionIdentifier: String, userExit: Bool)  {
        
        let locationMonitorRequest = LocationMonitorRequest(userName: regionIdentifier, location: Location2DCoordinate(locationLatitude: self.userLocation?.latitude, locationLongitude: self.userLocation?.longitude), userExit: userExit)
        
        self.userMoniterViewModel.updateUserLocation(locationMonitorRequest: locationMonitorRequest)
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
      // show alert to user for access permission
      if manager.authorizationStatus != .authorizedAlways {
        showAlert(withTitle: AppConstants.alertTitleForAccessPermission, message: AppConstants.alertMessageForAccessPermission)
      }
    }
}

extension UserMonitorViewController : UserMoniteriewModelDelegate{
    func didReceviveResponse(locationMonitorResponse: LocationMonitorResponse?) {
        
        if let responseData = locationMonitorResponse?.data {
            print(responseData.success)
        }
    }
}
