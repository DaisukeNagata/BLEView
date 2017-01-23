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
    var nameArray : [String] = []

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
        
        
        // single swipe up
        let swipeUpGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipeUp))
        swipeUpGesture.numberOfTouchesRequired = 1
        swipeUpGesture.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUpGesture)

    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func handleSwipeUp(sender: UITapGestureRecognizer){
        BlModel.sharedBLEView.setCut()
        setBLETableView()
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
        
        guard BlModel.sharedBLETableView.indx  == nil else {
            return name
        }

        var name = BlModel.sharedBlTextPeripheral.peripheral[BlModel.sharedBLETableView.indx].name
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
        self.setBLEGraphView()
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        self.setBLEGraphView()
       BlModel.sharedBLEView.setCut()
        return BlModel.sharedBLEView
    }
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
    
    func setBLEGraphView(){
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        let BLEDraw = BLECollectionView(frame: CGRect(x: 0, y: screenHeight/2, width: screenWidth, height: screenHeight/1.7))
        self.view.addSubview(BLEDraw)
    }
    
    func setBLETableView(){
        let BLETable = BLEAlertTableView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height-100))
        self.view.addSubview(BLETable)
    }
}
