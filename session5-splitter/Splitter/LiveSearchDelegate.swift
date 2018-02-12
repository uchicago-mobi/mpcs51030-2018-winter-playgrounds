//
//  LiveSearchDelegate.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/19/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

extension MasterViewController: UISearchBarDelegate {

  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.isEmpty {
        objects = allObjects
    } else {
      objects = allObjects.fil
    }

}


}