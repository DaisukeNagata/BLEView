//
//  ViewController.swift
//  BleSetSample
//
//  Created by 永田大祐 on 2016/09/19.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit
import CoreBluetooth
import AVFoundation
import UserNotifications

@available(iOS 10.0, *)
open class BLEView: UIViewController,CBPeripheralDelegate,AVSpeechSynthesizerDelegate,UITextFieldDelegate,UNUserNotificationCenterDelegate {
    
    open var textSam: UITextField!
    open var rtUserDefaults = UserDefaults.standard
    
    static let shared = BLEView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        blText.shared.bleSetting()
        self.textSam = UITextField(frame: CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 30))
        self.textSam.delegate = self
        self.view.addSubview(textSam)
        rtUserDefaults.set("", forKey: "DataStore")
        
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    open func getString(rt:String)->String {
        
        // Keyを指定して保存
        rtUserDefaults.set(rt, forKey: "DataStore")
        notification()
        return rt
    }
    //接続開始
    open func setVoice(ddd:String)   {
        let data2 = ddd.data(using: String.Encoding.utf8, allowLossyConversion:true)
        
        if blText.shared.characteristic == nil {
            blText.shared.pushStart(dddString:data2!)
        }else if  blText.shared.characteristic != nil {
            blText.shared.pushStart(dddString:data2!)
        }
    }
    //接続解除
    open func setCut(){
        blText.shared.pushCut()
    }
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textSam.resignFirstResponder()
        
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "\(textSam.text!)")
        synthesizer.speak(utterance)
        
        return true
    }
    open func userNotificationCenter(_ center: UNUserNotificationCenter,
                                     willPresent notification: UNNotification,
                                     withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
        completionHandler([.badge])
    }
    open func notification() {
        
        let centerAuthorization = UNUserNotificationCenter.current()
        centerAuthorization.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        //UNUserNotificationCenterDelegate
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let content = UNMutableNotificationContent()
        content.body = blText.shared.serString
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "Second",
                                            content: content,
                                            trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
    }
}
