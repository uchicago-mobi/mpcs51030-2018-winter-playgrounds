//
//  ViewController.swift
//  GroundhogDay
//
//  Created by T. Andrew Binkowski on 2/8/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  /// Player for background music
  var backgroundMusicPlayer = AVAudioPlayer()
  
  //
  // MARK: - Outlets and Actions
  //
  
  @IBOutlet weak var singleTapGesture: UITapGestureRecognizer!
  @IBOutlet weak var doubleTapGesture: UITapGestureRecognizer!
  
  
  // Add Flower without Gestures
  @IBAction func tapField(sender: UITapGestureRecognizer) {
    print("The field was tapped")
    
    // Find the field touch point
    let fieldView = sender.view
    let touchPoint = sender.location(in: fieldView)
    print("Touch Point: \(touchPoint)")
    
    // Create a flower image
    let flower = UIImage(named: "RedFlower")
    
    // Create image view of the flower
    let flowerImageView = UIImageView(image: flower)
    
    // Center the image view on the touch point
    flowerImageView.center = touchPoint
    
    // Enable interactions
    flowerImageView.isUserInteractionEnabled = true
    
    // Add it as a subview of the field
    fieldView?.addSubview(flowerImageView)
    
    // Add all the gestures to the flower
    addGesturesToView(flowerImageView)
  }
  
  @IBAction func doubleTapField(_ sender: UITapGestureRecognizer) {
    print("Double tap")
    // Find the field by using the tag
    guard let field = view.viewWithTag(100) else {
      return
    }
    
    // Only add a single groundhog to the scene
    let groundhog = GroundhogImageView(frame: CGRect.zero)
    field.addSubview(groundhog)
  }
  
  //
  // MARK: - Lifecycle
  //
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Help distinguish between single and triple tap behavior
    singleTapGesture.require(toFail: doubleTapGesture)
    
    // Start the music on load
    playBackgroundMusic("She loves you")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // Make the sun rise
    animateTheSun()
  }
  
  //
  // MARK: - Animations
  //
  /// Animate the sun from offscreen to the upper corner
  func animateTheSun() {
    
    // Find the field
    guard let field = view.viewWithTag(100) else {
      return
    }
    // Don't allow a tap while the sun is animating...it will look weird
    field.isUserInteractionEnabled = false
    
    // Get an offscreen position
    let offscreen = CGRect(x: 500, y: 500, width: 100, height: 100)
    
    // Create a sun image
    let sun = UIImage(named: "Sun")
    let sunView = UIImageView(image: sun)
    sunView.frame = offscreen
    
    // We want to be able to identify this
    sunView.tag = 101
    
    // Add the sun to the field
    field.addSubview(sunView)
    
    // Animate it
    UIView.animate(withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions(), animations: { () -> Void in
      sunView.center = CGPoint(x: 50, y: 50)
    }) { (finished) -> Void in
      print("The sun has risen")
      field.isUserInteractionEnabled = true
    }
  }
  
  
  //
  // MARK: - Music
  //
  
  func playBackgroundMusic(_ filename: String) {
    let url = Bundle.main.url(forResource: filename , withExtension: "mp3")
    guard let newURL = url else {
      print("Could not find file: \(filename)")
      return
    }
    
    do {
      backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
      backgroundMusicPlayer.numberOfLoops = -1
      backgroundMusicPlayer.prepareToPlay()
      backgroundMusicPlayer.play()
      backgroundMusicPlayer.volume = 0.2
      
    } catch let error as NSError {
      print(error.description)
    }
    
  }
  
  
  //
  // MARK: - UIResponder Methods
  //
  
  override var canBecomeFirstResponder : Bool {
    return true
  }
  
  override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      print("Shake begin detected")
    }
  }
  
  override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      print("Shake ended detected")
      
      // Play a sound
      SoundManager.sharedInstance.playBoing()
      
      // Find the field
      guard let field = view.viewWithTag(100) else {
        return
      }
      
      // Get all the subviews of the field
      guard let flowers = field.subviews as? [UIImageView] else {
        return
      }
      
      //      // Iterate through all subviews but don't remove the sun :)
      //      for flower in flowers {
      //        print(flower)
      //        if flower.tag < 100 {
      //          flower.removeFromSuperview()
      //        }
      //      }
      
      // Iterate through all subviews but don't remove the sun :)
      // ...but Swiftier
      for flower in flowers where flower.tag < 100 {
        flower.removeFromSuperview()
      }
      
    }
  }
  
  override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
    //
  }
  
}


