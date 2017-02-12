//
//  BLEAlertTableView.swift
//  Pods
//
//  Created by 永田大祐 on 2017/01/21.
//
//

import Foundation

class BLEAlertTableView:UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var indx = Int()
    private let Bsection : NSArray = [ "BLE" , "Beacon" ]
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.dataSource = self
        self.delegate = self
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Bsection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Bsection[section] as? String
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        BlModel.sharedBLEView.setCut()
        BlModel.sharedBLEView.nameArray.removeAll()
        BlModel.sharedBLECollectionView.getArray(reset:9)
        BlModel.sharedBLETableView.indx =  indexPath.row
        BlModel.sharedBLEView.setVoice(ddd: "接続しました")
        tableView.alpha = 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return BlModel.sharedBLEView.nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        if indexPath.section == 0 {
            cell.textLabel!.text = BlModel.sharedBlTextPeripheral.peripheral[indexPath.row].name
        }else if indexPath.section == 1 {
           cell.textLabel!.text = BlModel.sharedBLEBeacon.statusStr
        }
        
        return cell
    }
    
}
