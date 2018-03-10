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
  var label = "Splash"
  
  //
  // MARK: - IBOutlets
  //
  @IBOutlet weak var dismissButton: UIButton!
  @IBOutlet weak var screenLabel: UILabel!
  
  //
  // MARK: - IBActions
  //
  
  @IBAction func tapContinue(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  

  //
  // MARK: - Lifecyle
  //
  
  override func viewWillAppear(_ animated: Bool) {
    print("ViewWillAppear")

    self.screenLabel.text = self.label
    
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
