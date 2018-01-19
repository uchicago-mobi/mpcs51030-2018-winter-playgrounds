//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
  let newView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    // View is going to appear
    print("1")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("2")
    newView.frame = view.bounds
    newView.backgroundColor = .red
    UIView.transition(from: view,
                      to: newView,
                      duration: 3.0,
                      options: [.transitionCurlUp],
                      completion: nil)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    // View is going to disappear
    print("3")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    // View is gone
    print("4")}
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()



