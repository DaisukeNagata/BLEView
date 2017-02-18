//
//  BLEBEaconAuthenticationCall.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/12.
//
//

import UIKit
import CoreLocation

extension BLBeacon {
    
    func aurhnticationCall() {
        for i in 0 ..< UUIDList.count {
            
            let uuid = NSUUID(uuidString:UUIDList[i].lowercased())
            let identifierStr:String = "identifier" + UUIDList.count.description
            blBeaconRegion = CLBeaconRegion(proximityUUID: uuid! as UUID  , identifier: identifierStr)
            blBeaconRegion.notifyEntryStateOnDisplay = false
            blBeaconRegion.notifyOnEntry = true
            blBeaconRegion.notifyOnExit = true
            beaconRegionArray.append(blBeaconRegion)
            blLocationManager.startMonitoring(for: blBeaconRegion)
            
        }
    }
}
