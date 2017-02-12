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
    var myIds: NSMutableArray!
    var myUuids: NSMutableArray!
    var beaconRegionArray = [CLBeaconRegion]()
    // 認証のステータスをログで表示
    var statusStr = "";

    let UUIDList = [
    "12300100-39FA-4005-860C-09362F6169DA"
        ]

    override init() {
        super.init()
        
        // ロケーションマネージャの作成.
        blLocationManager = CLLocationManager()
        // デリゲートを自身に設定.
        blLocationManager.delegate = self
        // セキュリティ認証のステータスを取得
        let status = CLLocationManager.authorizationStatus()
        // 取得精度の設定.
        blLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 取得頻度の設定.(1mごとに位置情報取得)
        blLocationManager.distanceFilter = 1
        
        // まだ認証が得られていない場合は、認証ダイアログを表示
        if status == CLAuthorizationStatus.notDetermined {
            print("didChangeAuthorizationStatus:\(status)");
            // まだ承認が得られていない場合は、認証ダイアログを表示
            blLocationManager.requestWhenInUseAuthorization()
        }
    }
}
