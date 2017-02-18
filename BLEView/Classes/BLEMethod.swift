//
//  BLEMethod.swift
//  Pods
//
//  Created by 永田大祐 on 2017/02/05.
//
//

import Foundation

extension BLEView {
    
    //スワイプ
    func handleSwipeUp(sender: UITapGestureRecognizer){
        if BlModel.sharedBlTextCentral.name != ""{
           BlModel.sharedBLETableView.tableView.alpha = 1
            setBLETableView()
            BlModel.shatedBLEBLTimeCount.stopTimer()
            self.view.addSubview(BlModel.sharedBLEPicker.myDatePicker)
            BlModel.sharedBLEPicker.myDatePicker.isHidden = false
            // 値が変わった際のイベントを登録する.
            BlModel.sharedBLEPicker.myDatePicker.addTarget(self, action: #selector(BLEView.onDidChangeDate(sender:)), for: .valueChanged)
        }
    }
    
    //接続開始
    public func setVoice(ddd:String)   {
        let data2 = ddd.data(using: String.Encoding.utf8, allowLossyConversion:true)
        if  BlModel.sharedBlTextPeripheral.characteristic == nil {
            BlModel.sharedBlTextCentral.pushStart(dddString:data2!)
        }else if  BlModel.sharedBlTextPeripheral.characteristic != nil {
            BlModel.sharedBlTextCentral.pushStart(dddString:data2!)
        }
    }
    
    //接続解除
    public func setCut(){
        BlModel.sharedBlTextCentral.pushCut()
        BlModel.sharedBlTextPeripheral.stopAdvertise()
        BlModel.sharedBlTextPeripheral.startAdvertise()
        BlModel.sharedBlTextPeripheral.characteristic = nil
    }
    
    //接続情報の確認
    public  func setRSSI(rssi:NSNumber)->Int{
        var  rssi = BlModel.sharedBlTextCentral.number
        if rssi != nil {
            var rssiSet = rssi as! Int
        }
        if rssi == nil {
            rssi = 0
        }
        return  rssi as! Int
    }
    
    //接続端末名の確認
    public func setName(name:String)->String{
        
        guard BlModel.sharedBLETableView.indx  == nil else {
            return name
        }
        
        var name = BlModel.sharedBlTextPeripheral.peripheral[BlModel.sharedBLETableView.indx].name
        if name == nil {
            name  =  ""
        }
        return name!
    }
    
    //端末情報の取得
    public func tekioki () ->NSArray{
        if BlModel.sharedBlTextPeripheral.nsDat == nil{
            BlModel.sharedBlTextPeripheral.nsDat  = []
        }
        return BlModel.sharedBlTextPeripheral.nsDat
    }
    
    open func onDidChangeDate(sender: UIDatePicker){
        
    }
    
    //時間のセット
    public func setTimer(sender: UIDatePicker) {
        let myDateFormatter: DateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        
        mySelectedString = BLTimeCount.stringFromDate(date: BlModel.sharedBLEPicker.myDatePicker.date as NSDate, format: myDateFormatter.dateFormat)
        
        if mySelectedString == myDateFormatter.string(from: sender.date) {
            BlModel.shatedBLEBLTimeCount.timerSetting()
        }
    }
    
    //グラフセット
    public func BLEDrawView(num:NSNumber){
        self.setBLEGraphView()
    }
    
    func setBLEGraphView(){
        BlModel.shatedBLEBLTimeCount.stopTimer()
        BlModel.sharedBLEPicker.myDatePicker.isHidden = true
        let BLEDraw = BLECollectionView(frame: CGRect(x: 0, y: screenHeight/2, width: screenWidth, height: screenHeight/2))
        self.view.addSubview(BLEDraw)
    }
    
    func setBLETableView(){
        self.view.addSubview(BlModel.sharedBLETableView.tableView)
    }
}

