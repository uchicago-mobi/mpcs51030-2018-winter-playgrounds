//
//  AppDelegate.swift
//  LocalNotifications
//
//  Created by T. Andrew Binkowski on 3/6/17.
//  Copyright © 2017 T. Andrew Binkowski. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    UNUserNotificationCenter.current().delegate = self
    return true
  }
}

///
///
extension AppDelegate: UNUserNotificationCenterDelegate {
  
  /// Called when the app is in the foreground
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.alert, .badge, .sound])
  }
  
  /// Called when the app is in the background
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    
    print("AppDelegate: Did Receive: \(response)")
    
    // Determine the user action
    switch response.actionIdentifier {
    case UNNotificationDismissActionIdentifier:
      print("Dismiss Action")
    case UNNotificationDefaultActionIdentifier:
      print("Default")
    case "Snooze":
      print("Snooze")
    case "DeleteAction":
      print("Delete")
    default:
      print("Unknown action")
    }
    
    completionHandler()
  }
}
