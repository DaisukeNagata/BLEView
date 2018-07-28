//
//  BLECell.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/21.
//
//

import UIKit

class BLECell : UICollectionViewCell {
    
    var numArray :[Int] = []
    var line = UIBezierPath()
    var lineLayer = CAShapeLayer()
    var animation = CABasicAnimation(keyPath: "strokeEnd")
    var countHeight = 200
    var cgrect = 25
    var labelArray = Array<UILabel>()
    var one = BlModel.sharedBlUILabelOne
    var two = BlModel.sharedBlUILabelTwo
    var three = BlModel.sharedBlUILabelThree
    var four = BlModel.sharedBlUILabelFour
    var five = BlModel.sharedBlUILabelFive
    var six = BlModel.sharedBlUILabelSix
    var seven = BlModel.sharedBlUILabelSeven
    var eight = BlModel.sharedBlUILabelEight
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        numArray = BlModel.sharedBLECollectionView.getArray(reset: 1)

        self.transform = CGAffineTransform(scaleX: 1, y: -1)
        line.lineWidth = 4
        line.move(to: CGPoint(x: 0, y: 100))
        lineLayer.fillColor = UIColor.clear.cgColor
        
        labelArray.append(one)
        labelArray.append(two)
        labelArray.append(three)
        labelArray.append(four)
        labelArray.append(five)
        labelArray.append(six)
        labelArray.append(seven)
        labelArray.append(eight)
        
        var originX:Int = 25
        for i in 0..<numArray.count{
            line.addLine(to: CGPoint(x: originX, y: self.numArray[i]+150))
            labelArray[i].frame = CGRect(x:originX,y:self.numArray[i]+countHeight,width:cgrect,height:cgrect)
            labelArray[i].text = (self.numArray[i]/4).description
            _ =  labelSet(label: labelArray[i])
            self.addSubview(labelArray[i])
            originX += 50
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    
    func labelSet(label:UILabel)->UILabel{
        label.alpha = 1
        label.transform = self.transform
        setShapeLayer()
        return label
    }
    
    func setShapeLayer(){
        _ = shapeLayer(shape: lineLayer)
        _ = animationDraw(animation: animation)
        self.layer.addSublayer(shapeLayer(shape: lineLayer))
        shapeLayer(shape: lineLayer).add(animation, forKey: nil)
    }
    
    func shapeLayer(shape:CAShapeLayer)->CAShapeLayer{
        shape.lineWidth = 4
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillRule = kCAFillRuleEvenOdd
        shape.path = line.cgPath
        self.layer.addSublayer(shape)
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
    
}

