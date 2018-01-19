//
//  ViewController.swift
//  ScrollDemo
//
//  Created by T. Andrew Binkowski on 6/27/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  /// Scroll view holding the boxes
  @IBOutlet weak var scrollView: UIScrollView!
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    // Set the scrollview's delegate to this view controller.  For clarity, we
    // will conform to the protocol in an extension
    scrollView.delegate = self
    
    // Make the scrollview easier to see
    scrollView.backgroundColor = .gray
    
    
    // How big is the scrollable content (not the size you
    // see on the screen)
    scrollView.contentSize = CGSize(width: 1000, height: scrollView.frame.height)
    
    // Put a box at the end of the scrollview
    let box = UIView(frame: CGRect(x: 900,y: 50, width: 50, height: 50))
    box.backgroundColor = UIColor.green
    
    // Add the box to the view...careful of which view you
    // add it to...
    scrollView.addSubview(box)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
}


/// Tell ViewController to conform to the `UIScrollViewDelegate` and implement
/// some functions to receive updates on the scrolling status
///
extension ViewController: UIScrollViewDelegate {
  
  // MARK: - UIScrollViewDelegate Methods

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print("Scroll view is scrolling: \(scrollView.contentOffset)")
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    print("Done scrolling")
  }

  
}

