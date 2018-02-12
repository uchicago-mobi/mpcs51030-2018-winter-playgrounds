//
//  MasterViewController.swift
//  Splitter
//
//  Created by T. Andrew Binkowski on 2/14/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
  
  /// Search bar to filter the table
  @IBOutlet weak var searchBar: UISearchBar! {
    didSet { searchBar.delegate = self }
  }
  
  /// View controller to show details
  var detailViewController: DetailViewController? = nil
  
  /// Data source and delegate object for our table
  //let tableDataSourceDelegate = SimpleTableDataSourceDelegate()
  let tableDataSourceDelegate = TableDataSourceDelegate()
  
  
  //
  // MARK: - Life cycle
  //
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Autoresizing table views
    tableView.estimatedRowHeight = 44
    tableView.rowHeight = UITableViewAutomaticDimension
    
    // Split view controller stuff
    if let split = self.splitViewController {
      let controllers = split.viewControllers
      self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
    
    // Set the table source and delegate object
    self.tableView.delegate = tableDataSourceDelegate
    self.tableView.dataSource = tableDataSourceDelegate
   }
  
  override func viewWillAppear(_ animated: Bool) {
    self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  
  //
  // MARK: - Segue Navigation
  //
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    // Verify we are using the correct segue
    if segue.identifier == "showDetail" {
      
      // Get the index for the selected row
      if let indexPath = self.tableView.indexPathForSelectedRow {
        
        // Retrieve the object from the data array
        let object = tableDataSourceDelegate.objects[indexPath.row]
        
        // Navigate the hierarchy to find the detail view controller
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
        
        // Set the detail view controller's detailItem property
        controller.detailItem = object as AnyObject?
        
        // Set the bar button appropriately (depending on the preferences)
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        
        // Show the back button on the compact size
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
  
}


//
// 
//
extension MasterViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    print(searchBar.text!)
  }
  
  /// Access the text of the search bar as it is being typed
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchText)

    // Live search
    tableDataSourceDelegate.filterPrefixWithSearchText(searchText)
    //tableDataSourceDelegate.filterContainsWithSearchText(searchText)
    
    tableView.reloadData()
  }
  
}
