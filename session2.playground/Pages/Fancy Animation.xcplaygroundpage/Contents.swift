//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
  override func loadView() {
    let view = UIView()
    view.backgroundColor = .white
    self.view = view
  }
  
  override func viewDidLoad() {
    showComplexAnimation()
  }
  
  func showComplexAnimation() {
    
    //: ## Circle
    let circle = UIView(frame: CGRect(x: 100.0, y: 200.0,
                                      width: 50.0, height: 50.0))
    circle.layer.cornerRadius = 25.0
    let startingColor = UIColor.orange
    circle.backgroundColor = startingColor
    
    // Add the view to the containerView
    self.view.addSubview(circle);
    
    //: ## Add a rectangle with curved edge
    let rectangle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
    rectangle.center = self.view.center
    rectangle.layer.cornerRadius = 5.0
    rectangle.backgroundColor = UIColor.white
    self.view.addSubview(rectangle)
    
    //:
    UIView.animate(withDuration: 2.0, animations: { () -> Void in
      let endingColor = UIColor.green
      circle.backgroundColor = endingColor
      
      let scaleTransform = CGAffineTransform(scaleX: 5.0, y: 5.0)
      circle.transform = scaleTransform
      
      let rotationTransform = CGAffineTransform(rotationAngle: 3.14)
      rectangle.transform = rotationTransform
    }
    )
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


