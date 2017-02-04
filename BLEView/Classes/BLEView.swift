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
    
    open var textSam: UITextField!
    open let myDatePicker: UIDatePicker = UIDatePicker()
    open var rtUserDefaults = UserDefaults.standard
    
    var mySelectedString = String()
    var mySelectedData = NSDate()
    
    var num = NSNumber()
    var nameArray : [String] = []
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        BlModel.sharedBlTextCentral.bleSetting()
        BlModel.sharedBlTextPeripheral.bleSetting()
        self.textSam = UITextField(frame: CGRect(x: 0, y: 50, width: screenWidth, height: 30))
        self.textSam.backgroundColor = UIColor.lightGray
        self.textSam.delegate = self
        self.view.addSubview(textSam)
        rtUserDefaults.set("", forKey: "DataStore")
 
        // DatePickerを生成する.
        myDatePicker.frame = CGRect(x:0, y:screenHeight-200, width:screenWidth, height:200)
        myDatePicker.backgroundColor = UIColor.white
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.shadowOpacity = 0.5
        // 値が変わった際のイベントを登録する.
        myDatePicker.addTarget(self, action: #selector(BLEView.onDidChangeDate(sender:)), for: .valueChanged)
        
        
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
    
     open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textSam.resignFirstResponder()
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
