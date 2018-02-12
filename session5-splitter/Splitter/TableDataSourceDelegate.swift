//
//  TableDataSourceDelegate.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/19/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import Foundation
import UIKit

class Quote {
  let text: String
  let person: String
  
  init(text: String, person: String) {
    self.text = text
    self.person = person
  }
}

class TableDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
  
  //var quote = Quote(text: "Hi", person: "Andrew")
  //quote = Quote(text: "Bye", person: "Margret")
  
  let allObjects = ["To be prepared for war is one of the most effectual means of preserving peace.",
    "Government is not reason; it is not eloquence; it is force! Like fire, it is a dangerous servant and a fearful master.",
    "I pray Heaven to bestow the best of blessing on this house (the White House) and on all that shall hereafter inhabit it. May none but honest and wise men ever rule under this roof!",
    "You can fool all of the people some of the time, and some of the people all of the time, but you can not fool all of the people all of the time.",
    ]
  var objects = [String]()
  
  // MARK: - Initialization
  override init() {
    objects = allObjects
  }
  
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
  
  //
  // MARK: - Live filtering
  //
  
  func filterPrefixWithSearchText(_ text: String) {
    guard !text.isEmpty else {
      objects = self.allObjects
      return
    }
    
    // Swift
    objects = allObjects.filter({ (currentObject) -> Bool in
      return currentObject.hasPrefix(text)
    })
    
    // Swiftier
    objects = allObjects.filter({$0.hasPrefix(text)})
    
    // Swiftiest
    objects = allObjects.filter{$0.hasPrefix(text)}.sorted()
  }

  func filterContainsWithSearchText(_ text: String) {
    guard !text.isEmpty else {
      objects = self.allObjects
      return
    }
    
    // Swiftiest
    objects = allObjects.filter{$0.lowercased().contains(text.lowercased())}.sorted()
  }

}

