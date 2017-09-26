//
//  ViewController.swift
//  BLEView
//
//  Created by 永田大祐 on 12/05/2016.
//  Copyright (c) 2016 永田大祐. All rights reserved.
//

import UIKit
import BLEView
//BLEViewをデリゲートして機能を付与します。
class ViewController: BLEView {
    //BLEViewをtextfiledを追加します。
    var dd = BLEView().textSam
    var num = NSNumber()
    var st = String()
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dd = UITextField(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 30))
        self.view.addSubview(dd!)
        dd?.delegate = self
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //文字列を音声に通知します。
        BLEView().setVoice(ddd: (dd?.text!)!)
        //グラフを取得します。
        BLEDrawView(num: self.num)
        //BLEの電波強度を測定します。
        let numRssi = BLEView().setRSSI(rssi: self.num)
        //接続端末の取得
        let name = BLEView().setName(name:st)
        //サービス情報を取得します。
        let dx = BLEView().tekioki()
        //電波強度、文字を取得します。
        textView.text = ("\("Radial strength"+(numRssi * -1 ).description  + "\n"+name + dx.description )")
        
        dd?.resignFirstResponder()
        
        if dd?.text == ""  {
            //BLE通信の接続カット
            BLEView().setCut()
            
        }
        
        return true
    }
    
    override func onDidChangeDate(sender: UIDatePicker){
        
        let myDateFormatter: DateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        
        BLEView().setTimer(sender: sender)
        
    }

}
