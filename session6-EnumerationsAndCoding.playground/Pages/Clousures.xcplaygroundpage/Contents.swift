//: # Closures

import UIKit
import XCPlayground



//: Function with closure as a parameter
func doSomethingWithCompletion(completion: (String) -> Void) {
  let message = "Before the closure is run"
  // Execute the completion block with the required parameter
  completion(message)
}


//: Call a function with a completion handler (closure)
//: Message is the parameter; void is return type
doSomethingWithCompletion { (message) -> Void in
  // This code will be called as the completion block
  print("In closure...")
  print("Message from completion block: \(message)")
}

//: Trailing closure syntax.  Closure arguments can be
//: references by position ($0, $1, ...)

doSomethingWithCompletion {
  // This code will be called as the completion block
  print("In closure...")
  print("Message from completion block: \($0)")
}




