//
//  AppDelegate.swift
//  session10-splishsplash
//
//  Created by T. Andrew Binkowski on 3/7/18.
//  Copyright © 2018 T. Andrew Binkowski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var launchFromTerminated = false
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.launchFromTerminated = true
    return true
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    print("Entering background")
    showSplashScreen(autoDismiss: false, label: "👀")
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    print("Did become active")
    if launchFromTerminated {
      showSplashScreen(autoDismiss: false, label: "Splash")
      launchFromTerminated = false
    }
  }
  
}

extension AppDelegate {
  
  /// Load the SplashViewController from Splash.storyboard
  func showSplashScreen(autoDismiss: Bool, label: String) {
    let storyboard = UIStoryboard(name: "Splash", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
    
    // Control the behavior from suspended to launch
    controller.autoDismiss = autoDismiss
    controller.label = label
    
    // Present the view controller over the top view controller
    let vc = topController()
    vc.present(controller, animated: false, completion: nil)
  }
  
  
  /// Determine the top view controller on the screen
  /// - Returns: UIViewController
  func topController(_ parent:UIViewController? = nil) -> UIViewController {
    if let vc = parent {
      if let tab = vc as? UITabBarController, let selected = tab.selectedViewController {
        return topController(selected)
      } else if let nav = vc as? UINavigationController, let top = nav.topViewController {
        return topController(top)
      } else if let presented = vc.presentedViewController {
        return topController(presented)
      } else {
        return vc
      }
    } else {
      return topController(UIApplication.shared.keyWindow!.rootViewController!)
    }
  }
}


