//
//  DetailViewController.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/14/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailDescriptionLabel: UILabel!
  
  var detailItem: AnyObject? {
    didSet {
      // Update the view.
      self.configureView()
    }
  }
  
  func configureView() {
    // Update the user interface for the detail item.
    if let detail = self.detailItem {
      if let label = self.detailDescriptionLabel {
        label.text = detail.description
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.configureView()
  }
  
  //
  // MARK: - Navigation
  //
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    // When segueing to the `BookmarkViewController` set the delegate
    if segue.identifier == "segueToBookmarks" {
      let bvc = segue.destination as! BookmarkViewController
      bvc.delegate = self
    }
  }
  
}

//
// Implement the `DetailBookmarkDelegate` methods
//
extension DetailViewController: DetailBookmarkDelegate {

  func bookmarkPassedURL(_ url: String) {
    print("We passed \(url) from the bookmark view controller to the detail view controller")
  }

}

