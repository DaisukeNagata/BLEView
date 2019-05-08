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
open class BLEView: UIViewController,CBPeripheralDelegate,UITextFieldDelegate,UIViewControllerPreviewingDelegate,UIPickerViewDelegate {
    
    open var rtUserDefaults = UserDefaults.standard
    open var picker = BlModel.sharedBLEPicker.myDatePicker
    open var textSam = BlModel.sharedBLEFiled.BLTextSam

    var mySelectedString = String()
    var mySelectedData = NSDate()
    
    var num = NSNumber()
    var nameArray : [String] = []
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        BlModel.sharedBLEBeacon.aurhnticationCall()
        BlModel.sharedBlTextCentral.bleSetting()
        BlModel.sharedBlTextPeripheral.bleSetting()
        rtUserDefaults.set("", forKey: "DataStore")
        self.view.addSubview(textSam!)
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            print("3D Touch available")
            registerForPreviewing(with: self, sourceView: view)
        }
        
        // single swipe up
        let swipeUpGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipeUp))
        swipeUpGesture.numberOfTouchesRequired = 1
        swipeUpGesture.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUpGesture)
        
    }
        
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textSam?.resignFirstResponder()
        return true
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        self.setBLEGraphView()
        BlModel.sharedBlTextCentral.pushCut()
        
        return nil
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
}
