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
open class BLEView: UIViewController,CBPeripheralDelegate,AVSpeechSynthesizerDelegate,UITextFieldDelegate {
    
    open var textSam: UITextField!
    
    static let shared = BLEView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        blText.shared.bleSetting()
        self.textSam = UITextField(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 30))
        self.textSam.delegate = self
        self.view.addSubview(textSam)
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(1.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        //掛け算の後、割り算をしたい場合など掛け算をしてから実施する。
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            if blText.shared.characteristic == nil {
                self.action(name: blText.shared.name)
            }
        })
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear (animated)
    }
    
    //接続開始
    open func setVoice(ddd:String)   {
        if blText.shared.characteristic == nil {
            self.action(name: blText.shared.name)
        }
        
        let data2 = ddd.data(using: String.Encoding.utf8, allowLossyConversion:true)
        blText.shared.setVoice2(data:data2!)
    }
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textSam.resignFirstResponder()
        
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "\(textSam.text!)")
        synthesizer.speak(utterance)
        
        return true
    }
    
    func action(name:String) {
        //アラート表示
        let alertController = UIAlertController(title: "Hello!", message: "This is Bluetooth", preferredStyle: .alert)
        let otherAction = UIAlertAction(title: "\(name)", style: .default) {
            action in blText.shared.pushStart()
        }
        let cutAction = UIAlertAction(title: "Cancel", style: .default) {
            action in blText.shared.pushCut()
        }
        
        for _ in 0..<[name].count {
            alertController.addAction(otherAction)
            present(alertController, animated: true, completion: nil)
        }
        
        alertController.addAction(cutAction)
    }
}
