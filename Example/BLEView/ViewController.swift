//
//  ViewController.swift
//  BLEView
//
//  Created by 永田大祐 on 12/05/2016.
//  Copyright (c) 2016 永田大祐. All rights reserved.
//

import UIKit
import BLEView

class ViewController: BLEView {
    var dd = BLEView().textSam
    var num = NSNumber()
    var st = String()
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dd = UITextField(frame: CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 30))
        dd?.backgroundColor = UIColor.lightGray
        self.view.addSubview(dd!)
        dd?.delegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if dd?.text == "" {
            
            BLEView().setCut()
            dd?.text = ""
            
        }else if dd?.text != "" {
            
            setVoice(ddd: (dd?.text!)!)
            //BLEの電波強度を測定します。
            let numRssi = BLEView().setRSSI(rssi: self.num)
            //接続端末の取得
            let name = BLEView().setName(name:st)
            textView.text = ("\("Radial strength"+numRssi.description + "\n"+name)")
        }
        
        dd?.resignFirstResponder()
        return true
    }
}
