//
//  ViewController.swift
//  BlueToothTrackerApp
//
//  Created by Veldanov, Anton on 5/9/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var tableViewOutlet: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func refreshButtonClicked(_ sender: UIBarButtonItem) {
  }
  
  
  //MARK: - TableView Code
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BlueTableViewCell{
      
      cell.nameLabel.text = "this is a test"
      cell.rssiLabel.text = "RSSI: -28"
      
  
      return cell

    }
    // in case cell is not returned
    return UITableViewCell()
    
    
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   return 80
  }
  


  
}

