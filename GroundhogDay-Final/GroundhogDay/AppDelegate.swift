//
//  AppDelegate.swift
//  GroundhogDay
//
//  Created by T. Andrew Binkowski on 2/8/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    // Print out information about this application from the plist
    let infoDictionary = Bundle.main.infoDictionary!
    let version = infoDictionary["CFBundleShortVersionString"] as? String
    let build = infoDictionary["CFBundleVersion"] as? String
    print("\(version.debugDescription) build \(build.debugDescription)")
    
    return true
  }
}

