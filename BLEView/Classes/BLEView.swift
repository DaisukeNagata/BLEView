//
//  BLEView.swift
//  pods
//
//  Created by 永田大祐 on 2016/09/19.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit
import CoreBluetooth


@available(iOS 10.0, *)
open class BLEView: UIViewController,CBPeripheralDelegate,UITextFieldDelegate {
    
    open var textSam: UITextField!
    open var rtUserDefaults = UserDefaults.standard
    
    static let shared = BLEView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        BlTextCentral.shared.bleSetting()
        BlTextPeripheral.shared.bleSetting()
        self.textSam = UITextField(frame: CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 30))
        self.textSam.delegate = self
        self.view.addSubview(textSam)
        rtUserDefaults.set("", forKey: "DataStore")
        
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //接続開始
    open func setVoice(ddd:String)   {
        let data2 = ddd.data(using: String.Encoding.utf8, allowLossyConversion:true)
        
        if BlTextPeripheral.shared.characteristic == nil {
            BlTextCentral.shared.pushStart(dddString:data2!)
        }else if  BlTextPeripheral.shared.characteristic != nil {
            BlTextCentral.shared.pushStart(dddString:data2!)
        }
    }
    
    //接続解除
    open func setCut(){
        BlTextCentral.shared.pushCut()
        BlTextPeripheral.shared.stopAdvertise()
        BlTextPeripheral.shared.startAdvertise()
        BlTextPeripheral.shared.characteristic = nil
    }
    
    //接続情報の確認
    open func setRSSI(rssi:NSNumber)->NSNumber{
        var  rssi = BlTextCentral.shared.number
        if rssi == nil {
            rssi = 0
        }
        return rssi! as NSNumber
    }
    
    //接続端末名の確認
    open func setName(name:String)->String{
        var name = BlTextCentral.shared.name
        if name == nil {
            name  =  ""
        }
        return name!
    }
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textSam.resignFirstResponder()
        SoundNotification.shared.notification()
        return true
    }
    
}
