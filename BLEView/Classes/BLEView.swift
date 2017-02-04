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
    
    func handleSwipeUp(sender: UITapGestureRecognizer){
        if BlModel.sharedBlTextCentral.name != ""{
            setBLETableView()
            BlModel.shatedBLEBLTimeCount.stopTimer()
            self.view.addSubview(myDatePicker)
             myDatePicker.isHidden = false
        }
    }
    
    //接続開始
    public func setVoice(ddd:String)   {
        let data2 = ddd.data(using: String.Encoding.utf8, allowLossyConversion:true)
        if  BlModel.sharedBlTextPeripheral.characteristic == nil {
            BlModel.sharedBlTextCentral.pushStart(dddString:data2!)
        }else if  BlModel.sharedBlTextPeripheral.characteristic != nil {
            BlModel.sharedBlTextCentral.pushStart(dddString:data2!)
        }
    }
    
    //接続解除
    public func setCut(){
        BlModel.sharedBlTextCentral.pushCut()
        BlModel.sharedBlTextPeripheral.stopAdvertise()
        BlModel.sharedBlTextPeripheral.startAdvertise()
        BlModel.sharedBlTextPeripheral.characteristic = nil
    }
    
    //接続情報の確認
   public  func setRSSI(rssi:NSNumber)->Int{
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
    public func setName(name:String)->String{
        
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
    
    public func tekioki () ->NSArray{
        if BlModel.sharedBlTextPeripheral.nsDat == nil{
            BlModel.sharedBlTextPeripheral.nsDat  = []
        }
        return BlModel.sharedBlTextPeripheral.nsDat
    }
    
    open func onDidChangeDate(sender: UIDatePicker){
        
    }
    
    public func setTimer(sender: UIDatePicker) {
        let myDateFormatter: DateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        // 日付をフォーマットに則って取得.
        mySelectedString = BLTimeCount.stringFromDate(date: myDatePicker.date as NSDate, format: myDateFormatter.dateFormat)
     
        print(mySelectedString, myDateFormatter.string(from: sender.date),"111111")
        if mySelectedString == myDateFormatter.string(from: sender.date) {
            BlModel.shatedBLEBLTimeCount.timerSetting()
            myDatePicker.alpha = 0
        }
    }
    
    public func BLEDrawView(num:NSNumber){
        self.setBLEGraphView()
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        self.setBLEGraphView()
        BlModel.sharedBlTextCentral.pushCut()
        
        return nil
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
    
    func setBLEGraphView(){
        myDatePicker.isHidden = true
        BlModel.shatedBLEBLTimeCount.stopTimer()
        let BLEDraw = BLECollectionView(frame: CGRect(x: 0, y: screenHeight/2, width: screenWidth, height: screenHeight/1.7))
        self.view.addSubview(BLEDraw)
    }
    
    func setBLETableView(){
        let BLETable = BLEAlertTableView(frame: CGRect(x: 0, y: 100, width: screenWidth, height: self.view.bounds.height-100))
        self.view.addSubview(BLETable)
    }
    
}
