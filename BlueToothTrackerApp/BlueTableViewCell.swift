//
//  BlueTableViewCell.swift
//  BlueToothTrackerApp
//
//  Created by Veldanov, Anton on 5/9/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class BlueTableViewCell: UITableViewCell {

  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var rssiLabel: UILabel!
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
      backgroundColor = .red
  
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
