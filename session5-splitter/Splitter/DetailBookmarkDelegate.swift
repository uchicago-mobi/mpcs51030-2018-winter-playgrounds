//
//  DetailBookmarkDelegate.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/14/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import Foundation

/// Allow a view controller to communicate with our detail view controller
/// - Note: This is a class protocol so we declare it with keyword `class`.  
///         This allows us to make the delegates that implement it `weak`, 
///         preventing any potential retain cyles.

protocol DetailBookmarkDelegate: class {
  /// Pass a string representing a URL back to the a class that conforms to the
  /// protoocol
  func bookmarkPassedURL(_ url: String) -> Void

}
