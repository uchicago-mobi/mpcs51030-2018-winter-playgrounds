
//: # Tap Gesture #

import UIKit
import PlaygroundSupport


class MyViewController : UIViewController {

  //
  // MARK: - Properties
  //
  var box: UIView = {
    let frame = CGRect(x: 100,y: 100, width: 100, height: 100)
    let view = UIView(frame: frame)
    view.backgroundColor = .yellow
    return view
  }()
  
  //
  // MARK: - Lifecycle
  //
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Create a yellow box view
    self.view.addSubview(self.box)
    
    // Create a pan gesture recoginzer and add to box
    let panGesture = UIPanGestureRecognizer(target: self,
                                            action: #selector(handlePan(_:)))
    box.addGestureRecognizer(panGesture)
  }
  
  //
  // MARK: - Gesture Recognizers
  //
  
  /// Reposition the center of a view to correspond with a touch point
  /// - Parameter recognizer: The gesture that is recognized
  @objc func handlePan(_ recognizer:UIPanGestureRecognizer) {
    print(recognizer)
    
    // Determine where the view is in relation to the superview
    let translation = recognizer.translation(in: self.view)
    //print("Location: \(translation)")
    
    
    if let view = recognizer.view {
      // Set the view's center to the new position
      view.center = CGPoint(x:view.center.x + translation.x,
                            y:view.center.y + translation.y)
      print("👆 \(view.center)")
      
      // Observe the state through color change
      switch recognizer.state {
      case .began:
        view.backgroundColor = .green
      case .changed:
        view.backgroundColor = .red
      default:
        view.backgroundColor = .yellow
      }
    }
    
    // Reset the translation back to zero, so we are dealing
    // in offsets
    recognizer.setTranslation(CGPoint.zero, in: self.view)
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


