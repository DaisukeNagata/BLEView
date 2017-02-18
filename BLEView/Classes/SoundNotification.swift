//
//  SoundNotification.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/12.
//
//

import UIKit
import UserNotifications
import AVFoundation

class SoundNotification: NSObject,AVSpeechSynthesizerDelegate,UNUserNotificationCenterDelegate {
    
        open func userNotificationCenter(_ center: UNUserNotificationCenter,
                                     willPresent notification: UNNotification,
                                     withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
        completionHandler([.badge])
    }
    
    open func notification() {
        
        let centerAuthorization = UNUserNotificationCenter.current()
        centerAuthorization.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }

        UIApplication.shared.registerForRemoteNotifications()
        
        let content = UNMutableNotificationContent()
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: BlModel.sharedBlTextPeripheral.serString!)
        synthesizer.speak(utterance)
        content.body =  BlModel.sharedBlTextPeripheral.serString!

        //UNUserNotificationCenterDelegate
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        content.body = BlModel.sharedBlTextPeripheral.serString
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "Second",
                                            content: content,
                                            trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
    }
}
