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
            BlModel.sharedBlUILabelOne.alpha = 1
            BlModel.sharedBlUILabelOne.transform = self.transform
            BlModel.sharedBlUILabelOne.frame = CGRect(x:25,y:self.numArray[0]+20,width:25,height:25)
            BlModel.sharedBlUILabelOne.text = (self.numArray[0]/4).description
            self.addSubview(BlModel.sharedBlUILabelOne)
        }
        if numArray.count == 1{
            setShapeLayer()
        }
        if numArray.count > 1 {
            line.addLine(to: CGPoint(x: 75, y: self.numArray[1]))
            BlModel.sharedBlUILabelTwo.alpha = 1
            BlModel.sharedBlUILabelTwo.transform = self.transform
            BlModel.sharedBlUILabelTwo.frame = CGRect(x:75,y:self.numArray[1]+20,width:25,height:25)
            BlModel.sharedBlUILabelTwo.text = (self.numArray[1]/4).description
            self.addSubview(BlModel.sharedBlUILabelTwo)
        }
        if numArray.count == 2{
            setShapeLayer()
        }
        if numArray.count > 2 {
            line.addLine(to: CGPoint(x: 125, y: self.numArray[2]))
            BlModel.sharedBlUILabelThree.alpha = 1
            BlModel.sharedBlUILabelThree.transform = self.transform
            BlModel.sharedBlUILabelThree.frame = CGRect(x:125,y:self.numArray[2]+20,width:25,height:25)
            BlModel.sharedBlUILabelThree.text = (self.numArray[2]/4).description
            self.addSubview(BlModel.sharedBlUILabelThree)
            UIColor.red.setStroke()
        }
        if numArray.count == 3{
            setShapeLayer()
        }
        if numArray.count > 3 {
            line.addLine(to: CGPoint(x: 175, y: self.numArray[3]))
            BlModel.sharedBlUILabelFour.alpha = 1
            BlModel.sharedBlUILabelFour.transform = self.transform
            BlModel.sharedBlUILabelFour.frame = CGRect(x:175,y:self.numArray[3]+20,width:25,height:25)
            BlModel.sharedBlUILabelFour.text = (self.numArray[3]/4).description
            self.addSubview(BlModel.sharedBlUILabelFour)
        }
        if numArray.count == 4{
            setShapeLayer()
        }
        if numArray.count > 4 {
            line.addLine(to: CGPoint(x: 225, y: self.numArray[4]))
            BlModel.sharedBlUILabelFive.alpha = 1
            BlModel.sharedBlUILabelFive.transform = self.transform
            BlModel.sharedBlUILabelFive.frame = CGRect(x:225,y:self.numArray[4]+20,width:25,height:25)
            BlModel.sharedBlUILabelFive.text = (self.numArray[4]/4).description
            self.addSubview(BlModel.sharedBlUILabelFive)
        }
        if numArray.count == 5{
            setShapeLayer()
        }
        if numArray.count > 5 {
            line.addLine(to: CGPoint(x: 275, y: self.numArray[5]))
            BlModel.sharedBlUILabelSix.alpha = 1
            BlModel.sharedBlUILabelSix.transform = self.transform
            BlModel.sharedBlUILabelSix.frame = CGRect(x:275,y:self.numArray[5]+20,width:25,height:25)
            BlModel.sharedBlUILabelSix.text = (self.numArray[5]/4).description
            self.addSubview(BlModel.sharedBlUILabelSix)
        }
        if numArray.count == 6{
            setShapeLayer()
        }
        if numArray.count > 6 {
            line.addLine(to: CGPoint(x: 325, y: self.numArray[6]))
            BlModel.sharedBlUILabelSeven.alpha = 1
            BlModel.sharedBlUILabelSeven.transform = self.transform
            BlModel.sharedBlUILabelSeven.frame = CGRect(x:325,y:self.numArray[6]+20,width:25,height:25)
            BlModel.sharedBlUILabelSeven.text = (self.numArray[6]/4).description
            self.addSubview(BlModel.sharedBlUILabelSeven)
        }
        if numArray.count == 7{
            setShapeLayer()
        }
        if numArray.count > 7 {
            line.addLine(to: CGPoint(x: 375, y: self.numArray[7]))
            BlModel.sharedBlUILabelEight.alpha = 1
            BlModel.sharedBlUILabelEight.transform = self.transform
            BlModel.sharedBlUILabelEight.frame = CGRect(x:375,y:self.numArray[7]+20,width:25,height:25)
            BlModel.sharedBlUILabelEight.text = (self.numArray[7]/4).description
            self.addSubview(BlModel.sharedBlUILabelEight)
        }
        if numArray.count == 8{
            setShapeLayer()
        }
         UIColor.red.setStroke()
        line.stroke()
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
            BlModel.sharedBlUILabelOne.alpha = 0
            BlModel.sharedBlUILabelTwo.alpha = 0
            BlModel.sharedBlUILabelThree.alpha = 0
            BlModel.sharedBlUILabelFour.alpha = 0
            BlModel.sharedBlUILabelFive.alpha = 0
            BlModel.sharedBlUILabelSix.alpha = 0
            BlModel.sharedBlUILabelSeven.alpha = 0
        }
        return numArray
    }
}
