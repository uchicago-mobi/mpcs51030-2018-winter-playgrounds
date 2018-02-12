//
//  StringExtensions.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/20/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import Foundation


extension String {
  
  func contains(_ s: String) -> Bool {
    return (self.range(of: s) != nil) ? true : false
  }
  
}
