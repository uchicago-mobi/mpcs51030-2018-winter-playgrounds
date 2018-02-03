//
//  GroundhogView.swift
//  GroundhogDay
//
//  Created by T. Andrew Binkowski on 2/8/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class GroundhogImageView: UIImageView {

  //
  // MARK: - Initialization
  //
  
  override init (frame : CGRect) {
    super.init(frame : CGRect(x: 200, y: 500, width: 300, height: 300))
    self.image = UIImage(named: "Groundhog")
    self.tag = 102
    
    let singeTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
    self.addGestureRecognizer(singeTap)
    self.isUserInteractionEnabled = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  //
  // MARK: - Lifecyle 
  //
  override func didMoveToSuperview() {
    
    SoundManager.sharedInstance.playTink()
    
    // Animate it
    UIView.animate(withDuration: 2.0, delay: 1.0, options: UIViewAnimationOptions(), animations: { () -> Void in
      self.center = (self.superview?.center)!
      }) { (finished) -> Void in
        print("The groundhog has risen")
    }
  }
  
    
  //
  // MARK: - Gesture handlers
  //
  @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
     print("Groundhog was tapped")
  }
}
