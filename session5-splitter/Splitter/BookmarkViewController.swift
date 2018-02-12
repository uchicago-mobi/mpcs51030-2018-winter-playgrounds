//
//  BookmarkViewController.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/14/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
  
  /// Reference to the object that conforms to the `DetailBookmarkDelegate`
  weak var delegate: DetailBookmarkDelegate?
  
  /// When the button is tapped, pass a string back using the delegate protocol
  /// - Parameter sender: The button that was tapped
  @IBAction func tapButton(_ sender: UIButton) {
    // Call the protocol method
    delegate?.bookmarkPassedURL("hello from bookmarks")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
