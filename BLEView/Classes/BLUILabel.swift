//
//  BLUILabel.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/16.
//
//

import UIKit

class BLUILabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
