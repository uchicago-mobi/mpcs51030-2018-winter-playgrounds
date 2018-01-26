import Foundation
import PlaygroundSupport

// Tell playground we want to continue execution after page is done excecuting
PlaygroundPage.current.needsIndefiniteExecution = true

//: # Data structures

/// Hold the top level JSON
struct News: Codable {
  var status: String
  var totalResults: Int
  var articles: [Article]
}

/// Article data
struct Article: Codable {
  var title: String
  var author: String
  var description: String
  var urlToImage: URL
  var source: Source
  var url: URL
  var publishedAt: String
}

struct Source: Codable {
  var id: String?
  var name: String
}

//: # Function to retrieve JSON and pass the results to a completion block

/// Retrieve news stories and pass back a `News` object in the completion block `completion()`
/// - Attributions: Assignment write-up
/// - Parameter url: A `String` of the url
/// - Parameter completion: A closure to run on the converted JSON
func getNews(url: String, completion:@escaping (News?) -> Void) {
  
  // Transform the `url` parameter argument to a `URL`
  guard let url = NSURL(string: url) else {
    fatalError("Unable to create NSURL from string")
  }
  
  // Create a url session and data task
  let session = URLSession.shared
  let task = session.dataTask(with: url as URL, completionHandler: { (data, response, error) -> Void in

   // Print out the response (for debugging purpose)
    print("Response: \(response)")
    
    // Ensure there were no errors returned from the request
    guard error == nil else {
      fatalError("Error: \(error!.localizedDescription)")
    }
    
    // Ensure there is data and unwrap it
    guard let data = data else {
      fatalError("Data is nil")
    }
    
    // We received raw data, print it out for debugging.  It still needs to be converted to JSON.
    print("Raw data: \(data)")
    
    // Serialize the raw data into our custom structs
    do {
      // Covert JSON to `News`
      let decoder = JSONDecoder()
      let news = try decoder.decode(News.self, from: data)
      
      // Call the completion block closure and pass the News as argument to the completion block.
      completion(news)
    } catch {
      print("Error serializing/decoding JSON: \(error)")
    }
  })
  
  // Tasks start off in suspended state, we need to kick it off
  task.resume()
}



//: # Use the function to get the News

/// The array of dictionaries that will hold all of our issues data returned from the network request
var news: [News]?

/// The url of the JSON endpoint
let urlString = "https://newsapi.org/v2/everything?q=apple&from=2018-01-25&to=2018-01-25&sortBy=popularity&apiKey=34ba2541cc714c86ac43726f2f94eb10"


/// Get the news fromt the API. The data will be accessible in the `news` variable in the closure.
/// This would be a great place to update the table view showing the news.

getNews(url: urlString) { (news) in

  // If the request was successful, the data is available in this closure through the `news` variable

  // Print out for debugging
  if let news = news {
    for article in news.articles {
      print("> \(article.title) - \(article.source.name)")
      print("\t\(article.description) - \(article.url)")
    }
  }
  
  // For the assignment you wold copy the `news` to a property of the view controller so that it can persist beyond the closure block.  The property should be of the same type as the parameter here (eg. News)
  // self.news = news
  
  DispatchQueue.main.async {
    // Anything in here is execute on the main thread
    // You should reload your table here.
    //tableView.reload()
    
  }
  PlaygroundPage.current.finishExecution()
}


