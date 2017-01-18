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
    var numArray :[Int] = []
    var num = NSNumber()
    var line = UIBezierPath()
    var lineLayer = CAShapeLayer()
    var animation = CABasicAnimation(keyPath: "strokeEnd")
    var lineW = UIBezierPath()
    var lineCheck  =  0
    var countLine : CGFloat  =  0
    var countHeight = 50
    var cgrect = 25
    var one = BlModel.sharedBlUILabelOne
    var two = BlModel.sharedBlUILabelTwo
    var three = BlModel.sharedBlUILabelThree
    var four = BlModel.sharedBlUILabelFour
    var five = BlModel.sharedBlUILabelFive
    var six = BlModel.sharedBlUILabelSix
    var seven = BlModel.sharedBlUILabelSeven
    var eight = BlModel.sharedBlUILabelEight
    
    
    override func draw(_ rect: CGRect) {
        
        
        numArray = BlModel.sharedBLEGraph.getArray()
        self.transform = CGAffineTransform(scaleX: 1, y: -1)
        line.lineWidth = 4
        line.move(to: CGPoint(x: 0, y: 0))
        lineLayer.fillColor = UIColor.clear.cgColor
        
        if numArray.count > 0 {
            line.addLine(to: CGPoint(x: 25, y: self.numArray[0]))
            one.frame = CGRect(x:25,y:self.numArray[0]+countHeight,width:cgrect,height:cgrect)
            one.text = (self.numArray[0]/4).description
            self.addSubview(one)
            labelSet(label: one)
        }
        if numArray.count > 1 {
            line.addLine(to: CGPoint(x: 75, y: self.numArray[1]))
            two.frame = CGRect(x:75,y:self.numArray[1]+countHeight,width:cgrect,height:cgrect)
            two.text = (self.numArray[1]/4).description
            self.addSubview(two)
            labelSet(label: two)
        }
        if numArray.count > 2 {
            line.addLine(to: CGPoint(x: 125, y: self.numArray[2]))
            three.frame = CGRect(x:125,y:self.numArray[2]+countHeight,width:cgrect,height:cgrect)
            three.text = (self.numArray[2]/4).description
            self.addSubview(three)
            labelSet(label: three)
        }
        if numArray.count > 3 {
            line.addLine(to: CGPoint(x: 175, y: self.numArray[3]))
            four.frame = CGRect(x:175,y:self.numArray[3]+countHeight,width:cgrect,height:cgrect)
            four.text = (self.numArray[3]/4).description
            self.addSubview(four)
            labelSet(label: four)
        }
        if numArray.count > 4 {
            line.addLine(to: CGPoint(x: 225, y: self.numArray[4]))
            five.frame = CGRect(x:225,y:self.numArray[4]+countHeight,width:cgrect,height:cgrect)
            five.text = (self.numArray[4]/4).description
            self.addSubview(five)
            labelSet(label: five)
        }
        if numArray.count > 5 {
            line.addLine(to: CGPoint(x: 275, y: self.numArray[5]))
            six.frame = CGRect(x:275,y:self.numArray[5]+countHeight,width:cgrect,height:cgrect)
            six.text = (self.numArray[5]/4).description
            self.addSubview(six)
            labelSet(label: six)
        }
        if numArray.count > 6 {
            line.addLine(to: CGPoint(x: 325, y: self.numArray[6]))
            seven.frame = CGRect(x:325,y:self.numArray[6]+countHeight,width:cgrect,height:cgrect)
            seven.text = (self.numArray[6]/4).description
            self.addSubview(seven)
            labelSet(label: seven)
        }
        if numArray.count > 7 {
            line.addLine(to: CGPoint(x: 375, y: self.numArray[7]))
            eight.frame = CGRect(x:375,y:self.numArray[7]+countHeight,width:cgrect,height:cgrect)
            eight.text = (self.numArray[7]/4).description
            self.addSubview(eight)
            labelSet(label: eight)
        }
        
        UIColor.red.setStroke()
        line.stroke()
        
        for _ in 0...8{
            lineCheck += 50
            countLine += 50
            lineW.move(to: CGPoint(x: 0, y: lineCheck))
            lineW.addLine(to: CGPoint(x: screenWidth, y: countLine))
            lineW.close()
            UIColor.white.setStroke()
            lineW.lineWidth = 1
            lineW.stroke()
        }
    }
    
    func labelSet(label:UILabel)->UILabel{
        label.alpha = 1
        label.transform = self.transform
        setShapeLayer()
        return label
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
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = true
        return animation
    }
    
    func getArray()->[Int]{
        let number = BLEView().setRSSI(rssi: num) as! Int
        numArray+=[number * -4]
        if numArray.count > 8 {
            numArray.removeAll()
            BlModel.sharedBlUILabelOne.alpha = 0
        }
        return numArray
    }
}
