//
//  SoundManager.swift
//  GroundhogDay
//
//  Created by T. Andrew Binkowski on 2/8/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import Foundation
import AudioToolbox

class SoundManager {
  
  //
  static let sharedInstance = SoundManager()
  
  
  fileprivate init() {} //This prevents others from using the default '()' initializer for this class.
  
  ///
  func playTink() {
    // Load in a sound file (must be in the correct format)
    let beepUrl = Bundle.main.url(forResource: "Tink", withExtension: "caf")!
    
    // Assign an ID to the sound
    var beep: SystemSoundID = 0
    
    // Create a system sound
    AudioServicesCreateSystemSoundID(beepUrl as CFURL, &beep)
    
    // Add a completion handlers
    AudioServicesAddSystemSoundCompletion(beep, nil, nil, {
      sound, context in
      print("Sound finished playing")
      AudioServicesRemoveSystemSoundCompletion(sound)
      AudioServicesDisposeSystemSoundID(sound)
      }, nil)
    
    // Play the sound
    AudioServicesPlaySystemSound(beep)
  }

  ///
  func playBell() {}
  
  ///v
  func playBoing() {
    // Load in a sound file (must be in the correct format)
    let beepUrl = Bundle.main.url(forResource: "Cartoon Boing", withExtension: "caf")!
    
    // Assign an ID to the sound
    var beep: SystemSoundID = 0
    
    // Create a system sound
    AudioServicesCreateSystemSoundID(beepUrl as CFURL, &beep)
    
    // Add a completion handlers
    AudioServicesAddSystemSoundCompletion(beep, nil, nil, {
      sound, context in
      print("Sound finished playing")
      AudioServicesRemoveSystemSoundCompletion(sound)
      AudioServicesDisposeSystemSoundID(sound)
      }, nil)
    
    // Play the sound
    AudioServicesPlaySystemSound(beep)
  }


}
