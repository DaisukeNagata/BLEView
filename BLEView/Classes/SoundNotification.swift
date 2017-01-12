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
    static let shared = SoundNotification()
    open func userNotificationCenter(_ center: UNUserNotificationCenter,
                                     willPresent notification: UNNotification,
                                     withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
        completionHandler([.badge])
    }
    
    open func notification() {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "\(BlTextPeripheral.shared.serString)")
        synthesizer.speak(utterance)

        let centerAuthorization = UNUserNotificationCenter.current()
        centerAuthorization.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        //UNUserNotificationCenterDelegate
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let content = UNMutableNotificationContent()
        content.body = BlTextPeripheral.shared.serString
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "Second",
                                            content: content,
                                            trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
    }

}
