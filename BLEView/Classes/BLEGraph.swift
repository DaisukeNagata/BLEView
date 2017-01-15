//
//  BLEGraph.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/15.
//
//

import UIKit

class BLEGraph: UIView {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var numArray :[Int] = []
    var setGraph = Int()
    var setCount = Int()
    var num = NSNumber()
    
    override func draw(_ rect: CGRect) {
        numArray = BlModel.sharedBLEGraph.getArray().0
        
        self.transform = CGAffineTransform(scaleX: 1, y: -1)
        let line = UIBezierPath()

        if numArray.count > 0 {
        line.move(to: CGPoint(x: 25, y: 0));
        line.addLine(to: CGPoint(x: 25, y: numArray[0]))
        }
        if numArray.count > 1 {
            line.move(to: CGPoint(x: 75, y: 0));
            line.addLine(to: CGPoint(x: 75, y: numArray[1]))
        }
        if numArray.count > 2 {
            line.move(to: CGPoint(x: 125, y: 0));
            line.addLine(to: CGPoint(x: 125, y: numArray[2]))
        }
        if numArray.count > 3 {
            line.move(to: CGPoint(x: 175, y: 0));
            line.addLine(to: CGPoint(x: 175, y: numArray[3]))
        }
        if numArray.count > 4 {
            line.move(to: CGPoint(x: 225, y: 0));
            line.addLine(to: CGPoint(x: 225, y: numArray[4]))
        }
        if numArray.count > 5 {
            line.move(to: CGPoint(x: 275, y: 0));
            line.addLine(to: CGPoint(x: 275, y: numArray[5]))
        }
        if numArray.count > 6 {
            line.move(to: CGPoint(x: 325, y: 0));
            line.addLine(to: CGPoint(x: 325, y: numArray[6]))
        }
        if numArray.count > 7 {
            line.move(to: CGPoint(x: 375, y: 0));
            line.addLine(to: CGPoint(x: 375, y: numArray[7]))
        }
        UIColor.red.setStroke()
        line.lineWidth = 4
        line.stroke()
        line.close()

        // UIBezierPath のインスタンス生成
        let lineW = UIBezierPath();
        // 起点
        lineW.move(to: CGPoint(x: 0, y: 50));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 50));
        lineW.close()
        lineW.move(to: CGPoint(x: 0, y: 100));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 100));
        lineW.close()
        lineW.move(to: CGPoint(x: 0, y: 150));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 150));
        lineW.close()
        lineW.move(to: CGPoint(x: 0, y: 200));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 200));
        lineW.close()
        lineW.move(to: CGPoint(x: 0, y: 250));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 250));
        lineW.close()
        lineW.move(to: CGPoint(x: 0, y: 300));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 300));
        lineW.close()
        lineW.move(to: CGPoint(x: 0, y: 350));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 350));
        lineW.close()
        
        // 色の設定
        UIColor.white.setStroke()
        // ライン幅
        lineW.lineWidth = 1
        // 描画
        lineW.stroke();
        
    }
    
    func getArray()->([Int],Int){
        let number = BLEView().setRSSI(rssi: num) as! Int
        numArray+=[number * -4]
        if numArray.count > 8 {
            numArray.removeAll()
        }
        return (numArray,numArray.count)
    }
    
}
