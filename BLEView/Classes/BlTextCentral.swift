//
//  blTextCentral.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/12.
//
//

import Foundation
import CoreBluetooth
import UserNotifications
import AVFoundation

class BlTextCentral: NSObject,CBCentralManagerDelegate,CBPeripheralDelegate{
    
    var characteristicMutable: CBMutableCharacteristic!
    var centralManager:CBCentralManager!
    let serviceUUID = CBUUID(string: "DD9B8295-E177-4F8A-A5E1-DC5FED19556D")
    var peripheralManager: CBPeripheralManager!
    var characteristicCBC:CBMutableCharacteristic!
    var name :  String!
    var number : NSNumber!
    var identifier :  Int!
    
    func bleSetting(){
        
        // 初期化
        let option : Dictionary =  [
            CBCentralManagerRestoredStatePeripheralsKey: "dddaisuke"
        ]
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]){
        
        print("Central Manager Restored")
    }
    
    func  centralManagerDidUpdateState(_ central:CBCentralManager){
        print("CentralManagerDidUpdateState", central.state)
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        print("発見したBLEデバイス", peripheral)
        name = peripheral.name
        BlModel.sharedBlTextPeripheral.peripheral += [peripheral]
        number = RSSI
        BlModel.sharedBLEView.nameArray.append(contentsOf:  [name])

      }
    
    //接続開始
    func pushStart(dddString:Data){
        
        let option : Dictionary =  [
            CBCentralManagerRestoredStatePeripheralsKey: "dddaisuke"
        ]
        
        if BlModel.sharedBlTextPeripheral.peripheral != nil {
            if name != nil {
            self.centralManager.connect(BlModel.sharedBlTextPeripheral.peripheral[BlModel.sharedBLETableView.indx], options: option)
            
            setVoice2(data:dddString)
            }
        }
    }
    
    open  func setVoice2(data:Data)   {
        
        if   BlModel.sharedBlTextPeripheral.characteristic != nil {
            BlModel.sharedBlTextPeripheral.peripheral[BlModel.sharedBLETableView.indx].writeValue(data, for: BlModel.sharedBlTextPeripheral.characteristic, type: CBCharacteristicWriteType.withResponse)
        }else{
            self.centralManager.connect(BlModel.sharedBlTextPeripheral.peripheral[BlModel.sharedBLETableView.indx])
            let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
                if BlModel.sharedBlTextPeripheral.characteristic != nil {
                    BlModel.sharedBlTextPeripheral.peripheral[BlModel.sharedBLETableView.indx].writeValue(data, for: BlModel.sharedBlTextPeripheral.characteristic, type: CBCharacteristicWriteType.withResponse)
                }
            })
        }
    }
    
    //接続解除
    func pushCut(){
        
        print("接続カット！")
        if BlModel.sharedBlTextPeripheral.peripheral != nil {
            BlModel.sharedBlTextCentral.centralManager.cancelPeripheralConnection(BlModel.sharedBlTextPeripheral.peripheral[BlModel.sharedBLETableView.indx])
            BlModel.sharedBlTextPeripheral.peripheralManager.removeAllServices()
        }
    }
    
    func centralManager(_ central: CBCentralManager,
                        didConnect peripheral: CBPeripheral){
        
        print("接続成功！")
        peripheral.delegate = BlModel.sharedBlTextPeripheral
        //サービス探索開始
        peripheral.discoverServices(nil)
        
    }
    
    func centralManager(_ central:CBCentralManager,peripheral:CBPeripheral,error: NSError!){
        
        print("接続失敗！")
        //スキャン開始
        self.centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
        
    }
    
}
