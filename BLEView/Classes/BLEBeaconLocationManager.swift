//
//  BLEBeaconLocationManager.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/12.
//
//

import UIKit
import CoreLocation

extension BLBeacon {

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
        manager.requestState(for: region);
    }

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {

        switch (state) {
             case .inside:
                
            manager.startRangingBeacons(in: region as! CLBeaconRegion)
            break;
            
        case .outside:

            break;
            
        case .unknown:
            break
            
        }
    }

    func locationManager(manager: CLLocationManager,
                         didEnterRegion region: CLRegion) {
        manager.startRangingBeacons(in: region as! CLBeaconRegion)
        manager.startUpdatingLocation()

    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        manager.startRangingBeacons(in: region as! CLBeaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        manager.stopRangingBeacons(in: region as! CLBeaconRegion)
    }
}


