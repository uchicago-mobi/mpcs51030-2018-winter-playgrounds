//
//  NextViewController.swift
//  session3-viewcontrollers
//
//  Created by T. Andrew Binkowski on 1/26/18.
//  Copyright © 2018 T. Andrew Binkowski. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
  
  var greeting: String?
  
  @IBOutlet weak var greetingLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let greeting = self.greeting {
      self.greetingLabel.text = greeting
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  
}
