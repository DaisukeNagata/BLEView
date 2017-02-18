//
//  BLBeacon.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/12.
//
//

import UIKit
import CoreLocation

class BLBeacon: NSObject,CLLocationManagerDelegate {
    
    var blLocationManager:CLLocationManager!
    var blBeaconRegion:CLBeaconRegion!
    var beaconRegionArray = [CLBeaconRegion]()
    var statusStr = ""
    var proximity = ""
    
    let UUIDList = [
        "00000000-0000-0000-0000-0000000000000"
        ]

    override init() {
        super.init()
        
        blLocationManager = CLLocationManager()
        blLocationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        blLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        blLocationManager.distanceFilter = 1
        
        if status == CLAuthorizationStatus.notDetermined {

            blLocationManager.requestWhenInUseAuthorization()
        }
    }
}
