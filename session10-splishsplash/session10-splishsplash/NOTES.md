#  <#Title#>

```swift
func fancyTransition() {
//Animate between the view controller's views and then swap the root view controllers when donw
UIView.transition(from: self.view,
to: viewController.view,
duration: 0.5,
options: UIViewAnimationOptions.transitionFlipFromLeft) { (completed) -> Void in
if (completed) {
self.dismiss(animated: true, completion: nil)
}
}
}

/// Change the root view controller with a custom `UIView` animation using the
/// following steps:
/// 1. Take screnshot of the original view controller
/// 2. Add screenshot as subview of destination view controller
/// 3. Switch the root view controller
/// 4. Do animation that results in remove the snapshot.
///
//    func fancyTransition() {
//      // Load the initial view controller from `Main.storyboard`
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let viewController = storyboard.instantiateInitialViewController() as! ViewController
//
//      // Take a snapshot of the current view
//      let snapshot:UIView = (self.view.window?.snapshotView(afterScreenUpdates: true))!
//
//      // Add the snapshot on top of the `ViewController`'s `view`
//      viewController.view.addSubview(snapshot)
//
//      // Change the window's `rootViewController`.  The new view controller is now
//      // on screen with the old view controller snapshot on top
//      self.view.window?.rootViewController = viewController
//
//      // Animate the snapshot off the new view controller (ie. create your own
//      // transition animation
//      UIView.animate(withDuration: 1.0, animations: { () in
//        snapshot.layer.opacity = 0
//        snapshot.layer.transform = CATransform3DMakeScale(10, 10, 10)
//      }, completion: { (completed) in
//        // Remove the snapshot
//        snapshot.removeFromSuperview();
//      })
//
//    }

```
