//
//  BLTextFiled.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/08.
//
//

import UIKit

class BLTextFiled: UITextField {
    var BLTextSam: UITextField!

    override init(frame: CGRect){
        super.init(frame: frame)
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        self.BLTextSam = UITextField(frame: CGRect(x: 0, y: 50, width: screenWidth, height: 30))
        self.BLTextSam.backgroundColor = UIColor.lightGray
        self.addSubview(BLTextSam)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
