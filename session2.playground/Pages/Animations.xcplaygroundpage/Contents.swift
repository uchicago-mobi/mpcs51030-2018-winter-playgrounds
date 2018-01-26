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

    // Add a green box to our container view
    let greenView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    greenView.backgroundColor = UIColor.green
    self.view.addSubview(greenView)
    
    // Add a red box to our container view
    let redView = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
    redView.backgroundColor = UIColor.red
    self.view.addSubview(redView)
    
    
    // Add a rotation transform to our red box view
    UIView.animate(withDuration: 3.0, animations: { () -> Void in
      
      let rotationTransform = CGAffineTransform(rotationAngle: 3.14)
      redView.transform = rotationTransform
    })
    showComplexAnimation()
  }
  
  func showComplexAnimation() {
    
    //: ## Circle
    //: Note that we are setting the x and y to 0.0.  At
    //: this point we do not care where the view is
    //: posititioned.  We are going to position it using
    //: the `center` property later
    let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
    circle.center = self.view.center
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

