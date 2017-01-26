//
//  BLEGraph.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/15.
//
//

import UIKit

class BLECollectionView: UIView,UICollectionViewDataSource {
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    var numArray :[Int] = []
    var num = NSNumber()
    var collectionView:UICollectionView!
    
    override func draw(_ rect: CGRect) {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
//        flowLayout.minimumInteritemSpacing = 5.0
//        flowLayout.minimumLineSpacing = 5.0
        flowLayout.itemSize = CGSize(width:screenWidth, height:screenHeight)
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.register(BLECell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight/2)
        self.addSubview(collectionView)
        self.transform = CGAffineTransform(scaleX: 1, y: -1)

    }
    
    func getArray(reset:Int)->[Int]{
        let number = BLEView().setRSSI(rssi: num) as! Int
        numArray+=[number * -4]
        if numArray.count > 8 {
            numArray.removeAll()
            BlModel.sharedBlUILabelOne.alpha = 0
        }
        if reset > 8 {
            numArray.removeAll()
            BlModel.sharedBlUILabelOne.alpha = 0
        }

        return numArray
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getArray(reset: 1).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BLECell
        
        return cell
    }
}
