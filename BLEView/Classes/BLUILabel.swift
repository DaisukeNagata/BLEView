//
//  BLUILabel.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/16.
//
//

import UIKit

class BLUILabel: UILabel {

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.gray
    }
}

