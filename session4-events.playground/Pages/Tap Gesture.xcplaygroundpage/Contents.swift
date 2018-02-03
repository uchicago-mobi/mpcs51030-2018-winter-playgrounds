
//: # Tap Gesture #

import UIKit
import PlaygroundSupport


//: Custom UIView that implement touch handling functions
//: -----------------------------------------------------


class MyViewController : UIViewController {
  
  let colors: [UIColor] = [UIColor.red,.blue,.green,.purple]
  
  // Create a yellow box view
  var box: UIView = {
      let view  = UIView(frame: CGRect(x: 100,y: 100, width: 100, height: 100))
    view.backgroundColor = .yellow
    return view
  }()

  ///
  var currentColor: UIColor = .lightGray {
    didSet {
      self.box.backgroundColor = currentColor
      self.view.backgroundColor = oldValue
    }
  }
  
  // MARK: - Lifecylce
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(box)

    // Create a tap gesture recoginzer
    let tapGesture = UITapGestureRecognizer(target: self,
                                            action: #selector(handleTap2(_:)))
    
    tapGesture.numberOfTapsRequired = 1
    
    // Add tap gesture recognizer to the box
    box.addGestureRecognizer(tapGesture)
  }
 
  /// Handle the tap gesture recognizer
  @objc
  func handleTap2(_ gestureRecognizer: UIGestureRecognizer) {
    print("Tapped: \(gestureRecognizer)")
    self.currentColor = .blue
    print("View: \(String(describing: gestureRecognizer.view))")
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

