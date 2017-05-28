//
//  BLNotification.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/12.
//
//

import UIKit
import CoreLocation

extension BLBeacon {

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion)
    {
        if(beacons.count > 0){
            
            for i in 0 ..< beacons.count {
                
                let beacon = beacons[i]
                
                let rssi = beacon.rssi;
                
                var proximity = ""
                
                switch (beacon.proximity) {
                    
                case CLProximity.unknown :
                    print("Proximity: Unknown");
                    proximity = "Unknown"
                    break
                    
                case CLProximity.far:
                    print("Proximity: Far");
                    proximity = "Far"
                    break
                    
                case CLProximity.near:
                    print("Proximity: Near");
                    proximity = "Near"
                    break
                    
                case CLProximity.immediate:
                    print("Proximity: Immediate");
                    proximity = "Immediate"
                    break
                }
                
                BlModel.sharedBLEBeacon.blLocationManager = blLocationManager
                BlModel.sharedBLEBeacon.statusStr =  (rssi * -1 ).description
                BlModel.sharedBLEBeacon.proximity = proximity
                if BlModel.sharedBLEBeacon.statusStr != ""{
                    BlModel.sharedBLETableView.update()
                }

                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "beaconReceive"), object: self )
            }
        }
    }
}
