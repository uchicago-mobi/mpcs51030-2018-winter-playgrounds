//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

/// Custom UIView that implement touch handling functions
class RedBox: UIView {
  override init (frame : CGRect) {
    super.init(frame : CGRect(x: 0, y: 0, width: 100, height: 100))
    backgroundColor = UIColor.red
    
    let label = UILabel()
    label.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
    label.text = "Tap Me!"
    self.addSubview(label)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Touch handling
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "uniqueKey"), object: self, userInfo: ["hi":4] )
  }
}

///
///
///
class MyViewController : UIViewController {
  var label: UILabel? = {
    let l = UILabel()
    l.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
    return l
  }()
  
  ///
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white

    // Add the label
    view.addSubview(self.label!)

    // Add a red box
    let rb = RedBox()
    self.view.addSubview(rb)
  }
  
  ///
  override func viewDidLoad() {
    let nc = NotificationCenter.default
    nc.addObserver(forName: NSNotification.Name(rawValue: "uniqueKey"),
                   object: nil,
                   queue: nil) { (notification) in
      self.label?.text = "Recieved Notification"
                    print(notification)
    }
  }
  
  deinit {
    // Remove the notification observer so it will not be listenting to broadcasts anymore.
    NotificationCenter.default.removeObserver(self)
  }
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

