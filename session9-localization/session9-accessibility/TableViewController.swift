//
//  TableViewController.swift
//  session9-accessibility
//
//  Created by T. Andrew Binkowski on 3/3/18.
//  Copyright © 2018 T. Andrew Binkowski. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  @IBAction func tapSwitch(_ sender: UISwitch) {
    print(sender.isOn)
  }
  @IBOutlet weak var preferrsSound: UISwitch!
  
  @IBAction func tapButton(_ sender: UIButton) {
    print("tapped")
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
}
