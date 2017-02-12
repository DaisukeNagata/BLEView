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
            
            // BeaconのUUIDを設定.
            let uuid = NSUUID(uuidString:UUIDList[i].lowercased())
            
            // BeaconのIfentifierを設定.
            let identifierStr:String = "identifier" + UUIDList.count.description
            
            // リージョンを作成.
            blBeaconRegion = CLBeaconRegion(proximityUUID: uuid as! UUID , major: CLBeaconMajorValue(1), minor: CLBeaconMinorValue(2), identifier: identifierStr)
            
            // ディスプレイがOffでもイベントが通知されるように設定(trueにするとディスプレイがOnの時だけ反応).
            blBeaconRegion.notifyEntryStateOnDisplay = false
            
            // 入域通知の設定.
            blBeaconRegion.notifyOnEntry = true
            
            // 退域通知の設定.
            blBeaconRegion.notifyOnExit = true
            
            beaconRegionArray.append(blBeaconRegion)
            blLocationManager.startMonitoring(for: blBeaconRegion)
        }
        
    }
    /*
     (Delegate) 認証のステータスがかわったら呼び出される.
     */
    @nonobjc func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        print("didChangeAuthorizationStatus");
        
        switch (status) {
        case .notDetermined:
            statusStr = "NotDetermined"
            break
        case .restricted:
            statusStr = "Restricted"
            break
        case .denied:
            statusStr = "Denied"
            break
        case .authorizedAlways:
            statusStr = "AuthorizedAlways"
        case .authorizedWhenInUse:
            statusStr = "AuthorizedWhenInUse"
            for region in beaconRegionArray {
                manager.startMonitoring(for: region)
                manager.startRangingBeacons(in: region)
            }
        }
        print(" CLAuthorizationStatus: \(statusStr)")
        
    }
    
}
