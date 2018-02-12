//
//  SimpleTableViewDelegate.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/20/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import Foundation
import UIKit


class SimpleTableDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
  
  var objects = ["A","B","C","D"]
  
  // MARK: - Initialization
  override init() {}
  
  // MARK: - Table View
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let object = objects[indexPath.row]
    cell.textLabel!.text = object
    return cell
  }

}

