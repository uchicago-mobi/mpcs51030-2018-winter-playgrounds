import Foundation

struct Dog: Codable {
  var name: String
  var color: String
  var age: Int
}

//: Create a dog
let snoopy = Dog(name: "Snoopy", color: "White", age: 50)

// Encode and decode
let encoder = JSONEncoder()
if let encoded = try? encoder.encode(snoopy) {
  if let json = String(data: encoded, encoding: .utf8) {
    print(json)
  }
  
  let decoder = JSONDecoder()
  if let decoded = try? decoder.decode(Dog.self, from: encoded) {
    print(decoded)
  }
}

//: ---
//: Persist to disk
//:

/// Helper method to get a URL to the user's documents directory
/// - Returns: A URL to documents director
func getDocumentsURL() -> URL {
  if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    return url
  } else {
    fatalError("Could not retrieve documents directory")
  }
}

func savePostsToDisk(posts: [Dog]) {
  // Create a URL for documents-directory/posts.json
  let url = getDocumentsURL().appendingPathComponent("dogs.json")
  print("JSON location: \(url)")
  // Endcode our [Dogs] data to JSON Data
  let encoder = JSONEncoder()
  do {
    let data = try encoder.encode(posts)
    // Write this data to the url
    try data.write(to: url, options: [])
  } catch {
    fatalError(error.localizedDescription)
  }
}

func getPostsFromDisk() -> [Dog] {
  // Create a url for documents-directory/dogs.json
  let url = getDocumentsURL().appendingPathComponent("dogs.json")
  let decoder = JSONDecoder()
  do {
    // Retrieve the data on the file in this path
    let data = try Data(contentsOf: url, options: [])
    // Decode an array of from this data
    let posts = try decoder.decode([Dog].self, from: data)
    return posts
  } catch {
    fatalError(error.localizedDescription)
  }
}

savePostsToDisk(posts: [snoopy])

