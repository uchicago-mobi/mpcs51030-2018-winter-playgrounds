//
//  SplashViewController.swift
//  session10-splishsplash
//
//  Created by T. Andrew Binkowski on 3/7/18.
//  Copyright © 2018 T. Andrew Binkowski. All rights reserved.
//

import UIKit

class SplashViewController: ViewController {
  
  //
  // MARK: - Properties
  //
  var autoDismiss = false
  
  //
  // MARK: - IBOutlets
  //
  @IBOutlet weak var dismissButton: UIButton!
  
  //
  // MARK: - IBActions
  //
  
  @IBAction func tapContinue(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)
  }
  

  //
  // MARK: - Lifecyle
  //
  
  override func viewWillAppear(_ animated: Bool) {
    print("ViewWillAppear")

    // If auto-dismissing hide the button and rely on tap to dismiss
    if self.autoDismiss {
      self.dismissButton.isHidden = true
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        self.dismiss(animated: true, completion: {
          print("done")
        })
      }
    }
  }
  
}
