//
//  ViewController.swift
//  session9-accessibility
//
//  Created by T. Andrew Binkowski on 3/3/18.
//  Copyright © 2018 T. Andrew Binkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var greetingLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let greeting = NSLocalizedString("greeting", comment: "Something")
    self.greetingLabel.text = greeting
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

