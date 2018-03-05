//
//  AppDelegate.swift
//  HelpingHand
//
//  Created by T. Andrew Binkowski on 5/11/15.
//  Copyright (c) 2018 The University of Chicago. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    logFunctionName()
    
    // Do any additional setup after loading the view, typically from a nib.
    if (UIAccessibilityIsVoiceOverRunning()){
      print("Voice Over is running")
    } else {
      
      // This doesn't work because Voice Over is not enabled
      //UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification,"Voice Over is not on");
      
      let string = "Voice over is not enabled!  Please enable it."
      print(string)
      
      // Speak the string so that it will always be heard
      let utterance = AVSpeechUtterance(string: string)
      utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
      let synthesizer = AVSpeechSynthesizer()
      synthesizer.speak(utterance)
      
    }
    return true
  }
}

extension AppDelegate {

  /// Logging function
  func logFunctionName(file:String = #file, fnc:String = #function, line:(Int)=#line) {
    if let className = file.components(separatedBy: "/").last?.components(separatedBy: ".") {
      print("\(className[0]):\(fnc):\(line)")
    }
  }
  
}

