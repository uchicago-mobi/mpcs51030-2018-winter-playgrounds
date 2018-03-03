//
//  ViewController.swift
//  LocalNotifications
//
//  Created by T. Andrew Binkowski on 3/6/17.
//  Copyright © 2017 T. Andrew Binkowski. All rights reserved.
//

// https://developer.apple.com/videos/play/wwdc2016/707/
import UIKit
import UserNotifications
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
  
  /// Create a location manager
  lazy var locationManager: CLLocationManager =   { [unowned self] in
    let manager = CLLocationManager()
    manager.delegate = self as CLLocationManagerDelegate
    return manager
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestLocation()
    
    let options: UNAuthorizationOptions = [.alert, .sound];
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: options) {
      (granted, error) in
      if !granted {
        print("Something went wrong")
      }
    }
    
    // Swift
    center.getNotificationSettings { (settings) in
      if settings.authorizationStatus != .authorized {
        // Notifications not allowed
      }
    }
    
    
  }
  
  
  @IBAction func tapDelete(_ sender: Any) {
    listNotification()
    
    let center = UNUserNotificationCenter.current()
    center.removeAllPendingNotificationRequests()
    
    listNotification()
  }
  
  func listNotification() {
    UNUserNotificationCenter.current().getPendingNotificationRequests {
      requests in
      print(requests)
    }
    
    
  }
  
  @IBAction func tapCalendar(_ sender: UIButton) {
    let content = UNMutableNotificationContent()
    content.title = "Don't forget"
    content.body = "Buy some milk CALENDAR"
    content.sound = UNNotificationSound.default()
    content.categoryIdentifier = "CalendarCategory"
    
    let date = Date(timeIntervalSinceNow: 10)
    let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
                                                repeats: false)
    
    // Actions

    let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
    let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
    let category = UNNotificationCategory(identifier: "CalendarCategory",
                                          actions: [snoozeAction,deleteAction],
                                          intentIdentifiers: [], options: [])
    UNUserNotificationCenter.current().setNotificationCategories([category])

    
    // Add a notification
    let identifier = "Time Notification"
    let request = UNNotificationRequest(identifier: identifier,
                                        content: content,
                                        trigger: trigger)
    
    let center = UNUserNotificationCenter.current()
    center.add(request, withCompletionHandler: { (error) in
      if error != nil {
        // Something went wrong
      }
    })
    
    listNotification()
  }
  
  @IBAction func tapLocation(_ sender: UIButton) {
    let content = UNMutableNotificationContent()
    content.title = "Don't forget (Location)"
    content.body = "Buy some milk."
    content.sound = UNNotificationSound.default()
    
    
    let sf = CLLocationCoordinate2D(latitude: 37.78735890, longitude: -122.40822)
    let region = CLCircularRegion(center: sf, radius: 2000.0, identifier: "Headquarters")
    region.notifyOnEntry = true
    region.notifyOnExit = true
    let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
    
    // Add a notification
    let identifier = "Location Notification"
    let request = UNNotificationRequest(identifier: identifier,
                                        content: content,
                                        trigger: trigger)
    let center = UNUserNotificationCenter.current()
    center.add(request, withCompletionHandler: { (error) in
      if error != nil {
        // Something went wrong
      }
    })
    
    listNotification()
  }
  
  
  @IBAction func tapTime(_ sender: UIButton) {
    let content = UNMutableNotificationContent()
    content.title = "Don't forget"
    content.body = "Buy some milk"
    content.sound = UNNotificationSound.default()

     let url = Bundle.main.url(forResource: "spiderman", withExtension: "jpg")
     let attachment = try! UNNotificationAttachment(identifier: "image", url: url!, options: [:])
     content.attachments = [attachment]

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                    repeats: false)
    
    // Add a notification
    let identifier = "Time Notification"
    let request = UNNotificationRequest(identifier: identifier,
                                        content: content,
                                        trigger: trigger)
    let center = UNUserNotificationCenter.current()
    center.add(request, withCompletionHandler: { (error) in
      if error != nil {
        // Something went wrong
      }
    })
    
    listNotification()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print("Current Location:\(String(describing: locations.last))")
  }
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
}
