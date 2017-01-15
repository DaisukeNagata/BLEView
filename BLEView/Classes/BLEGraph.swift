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
    var num = NSNumber()
    var line = UIBezierPath()
    var lineLayer = CAShapeLayer()
    var animation = CABasicAnimation(keyPath: "strokeEnd")
    var lineW = UIBezierPath()

    override func draw(_ rect: CGRect) {
        
        numArray = BlModel.sharedBLEGraph.getArray()
        self.transform = CGAffineTransform(scaleX: 1, y: -1)
        line.lineWidth = 4

        if numArray.count > 0 {
            line.move(to: CGPoint(x: 0, y: 0))
            line.addLine(to: CGPoint(x: 25, y: self.numArray[0]))
            lineLayer.fillColor = UIColor.clear.cgColor
            setShapeLayer()
        }
        if numArray.count > 1 {
            line.addLine(to: CGPoint(x: 75, y: self.numArray[1]))
            setShapeLayer()
        }
        if numArray.count > 2 {
            line.addLine(to: CGPoint(x: 125, y: self.numArray[2]))
            setShapeLayer()
        }
        if numArray.count > 3 {
            line.addLine(to: CGPoint(x: 175, y: self.numArray[3]))
            setShapeLayer()
        }
        if numArray.count > 4 {
            line.addLine(to: CGPoint(x: 225, y: self.numArray[4]))
            setShapeLayer()
        }
        if numArray.count > 5 {
            line.addLine(to: CGPoint(x: 275, y: self.numArray[5]))
            setShapeLayer()
        }
        if numArray.count > 6 {
            line.addLine(to: CGPoint(x: 325, y: self.numArray[6]))
            setShapeLayer()
        }
        if numArray.count > 7 {
            line.addLine(to: CGPoint(x: 375, y: self.numArray[7]))
            setShapeLayer()
        }

        // 起点
        lineW.move(to: CGPoint(x: 0, y: 50));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 50));
        lineW.move(to: CGPoint(x: 0, y: 100));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 100));
        lineW.move(to: CGPoint(x: 0, y: 150));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 150));
        lineW.move(to: CGPoint(x: 0, y: 200));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 200));
        lineW.move(to: CGPoint(x: 0, y: 250));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 250));
        lineW.move(to: CGPoint(x: 0, y: 300));
        lineW.addLine(to: CGPoint(x: screenWidth, y: 300));
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
    func setShapeLayer(){
        shapeLayer(shape: lineLayer)
        animationDraw(animation: animation)
        self.layer.addSublayer(shapeLayer(shape: lineLayer))
        shapeLayer(shape: lineLayer).add(animation, forKey: nil)
    }
    func shapeLayer(shape:CAShapeLayer)->CAShapeLayer{
        shape.lineWidth = 4
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillRule = kCAFillRuleEvenOdd
        shape.path = line.cgPath
        return shape
    }
    
    func animationDraw(animation:CABasicAnimation)->CABasicAnimation{
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.fillMode = kCAFillModeBackwards
        animation.isRemovedOnCompletion = true
        return animation
    }
    func getArray()->[Int]{
        let number = BLEView().setRSSI(rssi: num) as! Int
        numArray+=[number * -4]
        if numArray.count > 8 {
            numArray.removeAll()
        }
        return numArray
    }
}
