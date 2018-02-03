//
//  ViewControllerExtensions.swift
//  GroundhogDay
//
//  Created by T. Andrew Binkowski on 2/2/18.
//  Copyright © 2018 The University of Chicago, Department of Computer Science. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
  

  //
  // MARK: - Gesture Recognizers
  //
 
  
  /// Add pinch, pan, rotate gestures to a view
  /// - Parameter view: The view to attach the gestures to
  func addGesturesToView(_ view: UIView) {
    
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(_:)))
    panGesture.delegate = self
    view.addGestureRecognizer(panGesture)
    
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch(_:)))
    pinchGesture.delegate = self
    view.addGestureRecognizer(pinchGesture)
    
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotate(_:)))
    rotateGesture.delegate = self
    view.addGestureRecognizer(rotateGesture)
  }
  
  /// Reposition the center of a view to correspond with a touch point
  /// - Parameter recognizer: The gesture that is recognized
  @objc func handlePan(_ recognizer:UIPanGestureRecognizer) {
    // Determine where the view is in relation to the superview
    let translation = recognizer.translation(in: self.view)
    
    if let view = recognizer.view {
      // Set the view's center to the new position
      view.center = CGPoint(x:view.center.x + translation.x,
                            y:view.center.y + translation.y)
    }
    
    // Reset the translation back to zero, so we are dealing in offsets
    recognizer.setTranslation(CGPoint.zero, in: self.view)
  }
  
  /// Apply transform to grow/shrink a view; reset to 1 when done
  /// - Parameter recognizer: The gesture that is recognized
  @objc func handlePinch(_ recognizer : UIPinchGestureRecognizer) {
    if let view = recognizer.view {
      view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
      recognizer.scale = 1
    }
  }
  
  /// Apply transform to rotate a view; reset to 0 when done
  /// - Parameter recognizer: The gesture that is recognized
  @objc func handleRotate(_ recognizer : UIRotationGestureRecognizer) {
    guard let view = recognizer.view else {
      return
    }
    
    // Only apply the rotation when starting and continuing to rotate
    guard recognizer.state == UIGestureRecognizerState.ended ||
      recognizer.state == UIGestureRecognizerState.changed else {
        return
    }
    
    view.transform = view.transform.rotated(by: recognizer.rotation)
    recognizer.rotation = 0
  }
}

extension ViewController {
  

}

///
/// Gesture Recognizer Protocol Delegate Methods
///
extension ViewController: UIGestureRecognizerDelegate {
  
  /// Ensure that the pinch, pan and rotate gesture recognizers on a particular
  /// view can all recognize simultaneously prevent other gesture recognizers
  /// from recognizing simultaneously
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    
    // If either of the gesture recognizers is the tap don’t allow
    // simultaneous recognition
    if gestureRecognizer is UITapGestureRecognizer || otherGestureRecognizer is UITapGestureRecognizer {
      return false
    }
      // Allow pan and rotate
    else if gestureRecognizer is UIPanGestureRecognizer || gestureRecognizer is UIRotationGestureRecognizer {
      return true
    }
      // Don't allow on anything else
    else {
      return false
    }
  }
}
