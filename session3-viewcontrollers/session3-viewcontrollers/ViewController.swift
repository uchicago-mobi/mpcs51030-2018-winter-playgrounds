//
//  ViewController.swift
//  session3-viewcontrollers
//
//  Created by T. Andrew Binkowski on 1/26/18.
//  Copyright © 2018 T. Andrew Binkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    let vc = segue.destination as? NextViewController
    vc?.greeting = "Hello"
  }


}

