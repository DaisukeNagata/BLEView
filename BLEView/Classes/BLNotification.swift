//
//  BLNotification.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/12.
//
//

import UIKit
import CoreLocation

extension BLBeacon{
    /*
     STEP6(Delegate): ビーコンがリージョン内に入り、その中のビーコンをNSArrayで渡される.
     */
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion)
    {
        
        // 配列をリセット
        myIds = NSMutableArray()
        myUuids = NSMutableArray()
        print(beacons.count)
        // 範囲内で検知されたビーコンはこのbeaconsにCLBeaconオブジェクトとして格納される
        // rangingが開始されると１秒毎に呼ばれるため、beaconがある場合のみ処理をするようにすること.
        if(beacons.count > 0){
            
            // STEP7: 発見したBeaconの数だけLoopをまわす
            for i in 0 ..< beacons.count {
                
                let beacon = beacons[i]
                
                let beaconUUID = beacon.proximityUUID;
                let minorID = beacon.minor;
                let majorID = beacon.major;
                let rssi = beacon.rssi;
                BlModel.sharedBLEBeacon.statusStr =  rssi.description

                print("UUID: \( beacon.proximityUUID)");
                print("minorID: \(minorID)");
                print("majorID: \(majorID)");
                print("RSSI: \(rssi)");
                
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
                
                let myBeaconId = "MajorId: \(majorID) MinorId: \(minorID)  UUID:\(beaconUUID) Proximity:\(proximity)"
                myIds.add(myBeaconId)
                myUuids.add(beacon.proximityUUID)
                
                // 通知してみる
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "beaconReceive"), object: self )
            }
        }
    }
}
