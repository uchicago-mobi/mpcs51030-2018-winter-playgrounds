//: # Multi-touch Events #

import UIKit
import PlaygroundSupport


//: Custom UIView that implement touch handling functions
//: -----------------------------------------------------


class RedBox: UIView {
  // MARK: - Initialization
  override init (frame : CGRect) {
    super.init(frame : CGRect(x: 100, y: 100, width: 100, height: 100))
    backgroundColor = UIColor.red
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Touch handling
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("👆Touches Began EVENT: \(String(describing: event))")
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("👆Touches Ended EVENT: \(String(describing: event))")
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("👆Touches Cancelled EVENT: \(String(describing: event))")
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("👆Touches Moved EVENT: \(String(describing: event))")
  }
}

//: -----------------------------------------------------


class MyViewController : UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let rb = RedBox()
    self.view.addSubview(rb)
  }
  
//  override func loadView() {
//    let view = UIView()
//    view.backgroundColor = .white
//    self.view = view
//    
//    let rb = RedBox()
//    self.view.addSubview(rb)
//  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

