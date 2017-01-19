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
open class BLEView: UIViewController,CBPeripheralDelegate,UITextFieldDelegate,UIViewControllerPreviewingDelegate {
    
    open var textSam: UITextField!
    open var rtUserDefaults = UserDefaults.standard
    var num = NSNumber()
    override open func viewDidLoad() {
        super.viewDidLoad()
        BlModel.sharedBlTextCentral.bleSetting()
        BlModel.sharedBlTextPeripheral.bleSetting()
        self.textSam = UITextField(frame: CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 30))
        self.textSam.delegate = self
        self.view.addSubview(textSam)
        rtUserDefaults.set("", forKey: "DataStore")
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            print("3D Touch available")
            registerForPreviewing(with: self, sourceView: view)
        }
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //接続開始
    open func setVoice(ddd:String)   {
        let data2 = ddd.data(using: String.Encoding.utf8, allowLossyConversion:true)
        
        if  BlModel.sharedBlTextPeripheral.characteristic == nil {
            BlModel.sharedBlTextCentral.pushStart(dddString:data2!)
        }else if  BlModel.sharedBlTextPeripheral.characteristic != nil {
            BlModel.sharedBlTextCentral.pushStart(dddString:data2!)
        }
    }
    
    //接続解除
    open func setCut(){
        BlModel.sharedBlTextCentral.pushCut()
        BlModel.sharedBlTextPeripheral.stopAdvertise()
        BlModel.sharedBlTextPeripheral.startAdvertise()
        BlModel.sharedBlTextPeripheral.characteristic = nil
    }
    
    //接続情報の確認
    open func setRSSI(rssi:NSNumber)->Int{
        var  rssi = BlModel.sharedBlTextCentral.number
        if rssi != nil {
        var rssiSet = rssi as! Int
        }
        if rssi == nil {
            rssi = 0
        }
        return  rssi as! Int
    }
    
    //接続端末名の確認
    open func setName(name:String)->String{
        var name = BlModel.sharedBlTextCentral.name
        if name == nil {
            name  =  ""
        }
        return name!
    }
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textSam.resignFirstResponder()
        BlModel.sharedSoundNotification.notification()
        return true
    }
    
    public func BLEDrawView(num:NSNumber){
        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        let BLEDraw = BLEGraph(frame: CGRect(x: 0, y: screenHeight/2.495, width: screenWidth, height: screenHeight/1.5))
        
        self.view.addSubview(BLEDraw)
    }
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        setCut()
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        let BLEDraw = BLEGraph(frame: CGRect(x: 0, y: screenHeight/2.495, width: screenWidth, height: screenHeight/1.5))
        self.view.addSubview(BLEDraw)
        return BlModel.sharedBLEView
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {

    }
}


