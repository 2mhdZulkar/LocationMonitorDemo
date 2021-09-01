//
//  UserMonitorViewController.swift
//  LocationDemo
//
//  Created by admin on 02/09/21.
//

import UIKit
import CoreLocation

class UserMonitorViewController: UIViewController {

    let locationManger:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    func setupLocationManger()  {
        
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        locationManger.distanceFilter = 100
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UserMonitorViewController : CLLocationManagerDelegate{
    
}
