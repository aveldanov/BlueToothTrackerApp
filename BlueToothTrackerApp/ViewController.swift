//
//  ViewController.swift
//  BlueToothTrackerApp
//
//  Created by Veldanov, Anton on 5/9/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate {
  
  var centralManager : CBCentralManager?
  var peripheralNames: [String] = []
  var RSSIs: [NSNumber] = []
  var timer: Timer?
  
  @IBOutlet weak var tableViewOutlet: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    centralManager = CBCentralManager(delegate: self, queue: nil)
    
  }
  
  //MARK: - CBCentralManager Code
  
  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
    
    if let name = peripheral.name{
      
      peripheralNames.append(name)
      
      
      //      print("Periphiral Name: \(name)")
    }else{
      
      peripheralNames.append(peripheral.identifier.uuidString)
    }
    
    RSSIs.append(RSSI)
    
    tableViewOutlet.reloadData()
    
    //    print("Periphiral UUID: \(peripheral.identifier.uuidString)")
    //    print("RSSI: \(RSSI)")
    //    print("Ad Data: \(advertisementData)")
    
    
    //    print("*******************")
    
  }
  
  
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    if central.state == .poweredOn{
      // Working
      // scan for devices
      startScan()
      
      timerStart()
    }else{
      // not working, alert pops up
      
      let alertVC = UIAlertController(title: "BlueTooth is not working", message: "Make sure your BlueTooth is on", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
        alertVC.dismiss(animated: true, completion: nil)
      }
      alertVC.addAction(okAction)
      present(alertVC, animated: true, completion: nil)
    }
  }
  
  
  
  
  
  
  //MARK: - TableView Code
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return peripheralNames.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BlueTableViewCell{
      
      cell.nameLabel.text = peripheralNames[indexPath.row]
      cell.rssiLabel.text = "RSSI: \(RSSIs[indexPath.row])"
      
      //      cell.nameLabel.text = "this is a test"
      //      cell.rssiLabel.text = "RSSI: -28"
      
      
      return cell
      
    }
    // in case cell is not returned
    return UITableViewCell()
    
    
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  
  func startScan(){
    
    peripheralNames = []
    RSSIs = []
    tableViewOutlet.reloadData()
    
    // start searching for devices
    centralManager?.stopScan()
    centralManager?.scanForPeripherals(withServices: nil, options: nil)
    
  }
  
  
  
  
  
  @IBAction func refreshButtonClicked(_ sender: UIBarButtonItem) {
    startScan()
    timerStart()
  }
  
  
  
}



extension ViewController{
  
  func timerStart(){
    
    timer?.invalidate()

    timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { (timer) in
      self.startScan()
    })
  }
}
