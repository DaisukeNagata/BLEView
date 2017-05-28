//
//  BLPickerView.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/08.
//
//

import UIKit

class BLPickerView: UIPickerView {
     let myDatePicker: UIDatePicker = UIDatePicker()

    override init(frame: CGRect){
        super.init(frame: frame)
        // DatePickerを生成する.
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        myDatePicker.frame = CGRect(x:0, y:screenHeight-200, width:screenWidth, height:200)
        myDatePicker.backgroundColor = UIColor.white
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.shadowOpacity = 0.5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
}
