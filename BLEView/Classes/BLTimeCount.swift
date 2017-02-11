//
//  BLTimeCount.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/04.
//
//

import Foundation

class BLTimeCount{
    var timer = Timer()
    var st = String()
    class func stringFromDate(date: NSDate, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateStyle = DateFormatter.Style.full
        formatter.timeStyle = DateFormatter.Style.short
        formatter.dateFormat = format
        return formatter.string(from: date as Date)
    }
    
    @objc func timerSetting(){
        
        timer.fire()
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(update(tm:)), userInfo: nil, repeats: true)
    }
    
    @objc func update(tm: Timer){
        
        BlModel.sharedBLEView.setCut()
        BlModel.sharedBLEView.setVoice(ddd: "接続しました")
//        BLEView().setName(name:st)
//        BlModel.sharedBLEView.setBLEGraphView()
    }
    
    func stopTimer(){
        timer.invalidate()
        if timer != nil {
            timer == nil
        }
    }
}
