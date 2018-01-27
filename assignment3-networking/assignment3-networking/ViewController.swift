//
//  ViewController.swift
//  assignment3-networking
//
//  Created by T. Andrew Binkowski on 1/27/18.
//  Copyright © 2018 T. Andrew Binkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //
  // MARK: - Properties
  //
  
  /// `News` data returned from the network request
  var news: News?
  
  /// The url of the JSON endpoint
  let urlString = "https://newsapi.org/v2/everything?q=apple&from=2018-01-25&to=2018-01-25&sortBy=popularity&apiKey=34ba2541cc714c86ac43726f2f94eb10"
  
  //34ba2541cc714c86ac43726f2f94eb10

  
  //
  // MARK: - LifeCyle
  //
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // The data is available in this closure through the `news` variable. Copy the `news` to a property of the view controller so that it can persist beyond the closure block.
    self.getNews(url: urlString) { (news) in
      self.news = news
      
      // Print out for debugging
      if let news = news {
        for article in news.articles {
          print("> \(article.title) - \(article.source.name)")
        }
      }
      
      DispatchQueue.main.async {
        // Update any views with the newly downloaded news data
      }
    }
  }
  
  
  
  //
  // MARK: - Networking
  //
  
  //Retrieve class Issues using GitHub API v3 and pass back the array of dictionaries in the completion block `completion()`
  /// - Parameter url: A `String` of the url
  /// - Parameter completion: A closure to run on the converted JSON
  /// - Returns: An `Array` of `Dictionary` objects
  func getNews(url: String, completion:@escaping (News?) -> Void) {
    
    // Transform the `url` parameter argument to a `URL`
    guard let url = NSURL(string: url) else {
      fatalError("Unable to create NSURL from string")
    }
    
    // Create a url session
    let session = URLSession.shared
    
    // Create a data task
    let task = session.dataTask(with: url as URL, completionHandler: { (data, response, error) -> Void in
      
      // Print out the response (for debugging purpose)
      print("Response: \(String(describing: response))")
      
      // Ensure there were no errors returned from the request
      guard error == nil else {
        fatalError("Error: \(error!.localizedDescription)")
      }
      
      // Ensure there is data and unwrap it
      guard let data = data else {
        fatalError("Data is nil")
      }
      // Print out for debugging
      print("Raw data: \(data)")
      

      // Covert JSON to `News` type using `JSONDecoder` and `Codable` protocol
      do {
        let decoder = JSONDecoder()
        let news = try decoder.decode(News.self, from: data)
        // Call the completion block closure with the news data
        completion(news)
      } catch {
        print("Error serializing/decoding JSON: \(error)")
      }
    })
    
    // Tasks start off in suspended state, we need to kick it off
    task.resume()
  }
}

