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
        "00010203-0405-0607-0809-0A0B0C0D0E0F"
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
