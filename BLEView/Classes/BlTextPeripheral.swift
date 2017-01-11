//
//  blText.swift
//  Pods
//
//  Created by 永田大祐 on 2016/12/27.
//
//

import Foundation
import CoreBluetooth
import UserNotifications
import AVFoundation

class BlTextPeripheral:NSObject,CBPeripheralDelegate,CBPeripheralManagerDelegate,UNUserNotificationCenterDelegate{
    
    var peripheral:CBPeripheral!
    var characteristic:CBCharacteristic!
    let serviceUUID = CBUUID(string: "DD9B8295-E177-4F8A-A5E1-DC5FED19556D")
    var peripheralManager: CBPeripheralManager!
    var characteristicCBC:CBMutableCharacteristic!
    var serString : String!
    
    static let shared = BlTextPeripheral()
    func bleSetting(){
        
        // 初期化
        let option : Dictionary =  [
            CBCentralManagerRestoredStatePeripheralsKey: "dddaisuke"
        ]
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil , options:option)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager,
                           willRestoreState dict: [String : Any]) {

        let option : Dictionary =  [
            CBCentralManagerRestoredStatePeripheralsKey: "dddaisuke"
        ]
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil , options:option)
        print("Peripheral Manager Restored")
    }
    
    
    // サービス発見時に呼ばれる
    func peripheral(_ peripheral : CBPeripheral, didDiscoverServices error : Error?){
        
        if let error = error {
            print("エラー\(error)")
            return
        }
        
        let services = peripheral.services as NSArray!
        print("\(services?.count)サービスを発見",services!.count, services!)
        
        for  service in services! {
            
            // キャラクタリスティック探索開始
            peripheral.discoverCharacteristics(nil, for: service as! CBService)
        }
    }
    
    // キャラクタリスティック発見時に呼ばれる
    func peripheral(_ peripheral: CBPeripheral,
                           didDiscoverCharacteristicsFor service: CBService,
                           error: Error?){
        if let error = error {
            print("エラー\(error)")
            return
        }
        
        let characteristics  = service.characteristics
        print(" \(characteristics?.count)個のキャラクタリスティックを発見!",characteristics!.count, characteristics!)
        
        
        // 特定のキャラクタリスティックをプロパティに保持
        let uuid = CBUUID(string:"45088E4B-B847-4E20-ACD7-0BEA181075C2")
        
        for aCharacteristic:CBCharacteristic in characteristics! {
            if aCharacteristic.uuid.isEqual(uuid) {
                
                self.characteristic = aCharacteristic
                break;
            }
        }
    }
    
    func  peripheral (_ peripheral: CBPeripheral,
                             didUpdateValueFor characteristic: CBCharacteristic,
                             error: Error?) {
        if let error = error {
            
            print("Read失敗", error, characteristic.uuid)
            return
            
        }
        
        print("Read成功",characteristic.service.uuid, characteristic.uuid, characteristic.value!)
    }
    
    func peripheral(_ peripheral: CBPeripheral,
                           didWriteValueFor characteristic: CBCharacteristic,
                           error: Error?){
        print("Write成功!")
    }
    
      
    func startAdvertise() {
        // アドバタイズメントデータを作成する
        let advertisementData = [
            CBAdvertisementDataLocalNameKey: "Test Device",
            CBAdvertisementDataServiceUUIDsKey: [serviceUUID]
            ] as [String : Any]
        
        // アドバタイズ開始
        peripheralManager.startAdvertising(advertisementData)
        
    }
    
    func stopAdvertise () {
        
        // アドバタイズ停止
        peripheralManager.stopAdvertising()
        
    }
    
    // ペリフェラルマネージャの状態が変化すると呼ばれる
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print("state: \(peripheral.state)")
        
        switch peripheral.state {
        case .poweredOn:
            
            // サービス登録開始
           publishservice()
        case.poweredOff:
           BlTextCentral.shared.pushCut()
        default:
            break
        }
    }
    
    func publishservice () {
        
        // サービスを作成
        let service = CBMutableService(type: serviceUUID, primary: true)
        let characteristicUUID = CBUUID(string: "45088E4B-B847-4E20-ACD7-0BEA181075C2")
        let properties: CBCharacteristicProperties = [.read, .write]
        let permissions: CBAttributePermissions = [.readable, .writeable]
        
        characteristicCBC = CBMutableCharacteristic(
            type: characteristicUUID,
            properties: properties,
            value: nil,
            permissions: permissions)
        
        // キャラクタリスティックをサービスにセット
        service.characteristics = [characteristicCBC]
        peripheralManager.add(service)
    }

    // サービス追加処理が完了すると呼ばれる
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error {
            
            print("サービス追加失敗！ error: \(error)")
            return
        }
        print("サービス追加成功！")
        
        // アドバタイズ開始
        startAdvertise()
    }
    
    // アドバタイズ開始処理が完了すると呼ばれる
     func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
    
            print("アドバタイズ開始失敗！ error: \(error)")
            return
        }
        print("アドバタイズ開始成功！")
        //スキャン開始
        BlTextCentral.shared.centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
        
    }
    
      // Writeリクエスト受信時に呼ばれる
    @available(iOS 10.0, *)
     func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        
        print("\(requests.count) 件のWriteリクエストを受信！")
        for request in requests {
            if characteristicCBC != nil  {
                
                if request.characteristic.uuid.isEqual(characteristicCBC.uuid){
                    
                    // CBMutableCharacteristicのvalueに、CBATTRequestのvalueをセット
                    characteristicCBC.value = request.value
                    
                }
            }
            serString = String(data: characteristicCBC.value!,encoding: String.Encoding.utf8)
            
            // リクエストに応答
            peripheralManager.respond(to: requests[0] , withResult: CBATTError.Code.success)
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                (granted, error) in
            }
            UIApplication.shared.registerForRemoteNotifications()
            let content = UNMutableNotificationContent()
            let synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: serString!)
            synthesizer.speak(utterance)
            content.body =  serString!
            SoundNotification.shared.notification()
        }
    }
}
