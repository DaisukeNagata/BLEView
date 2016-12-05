//
//  ViewController.swift
//  DddBleView
//
//  Created by 永田大祐 on 12/05/2016.
//  Copyright (c) 2016 永田大祐. All rights reserved.
//

import UIKit
import BLEView

class ViewController: BLEView {
    var dd = BLEView().textSam
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dd = UITextField(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 30))
        dd?.backgroundColor = UIColor.lightGray
        self.view.addSubview(dd!)
        dd?.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textSam.text = dd?.text
        setVoice(ddd: textSam.text!)
        dd?.resignFirstResponder()
        return true
    }
}
