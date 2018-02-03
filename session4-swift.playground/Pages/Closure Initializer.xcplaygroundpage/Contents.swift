//: # Default property value with a Closure

//: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID232

import UIKit

//: Hello world 3 ways
var message = "Hello World"

// Function initialization
func generateGreeting() -> String {
  return "Hello World"
}
var generatedMessage = generateGreeting()

// Closure initialization
var generatedViaClosure: String = {
  let greeting = "Hello"
  let noun = "World"
  return greeting + noun
}()


//: Where you might actually use this (see "Events" playground
var box: UIView = {
  let view  = UIView(frame: CGRect(x: 100,y: 100, width: 100, height: 100))
  view.backgroundColor = .gray
  return view
}()

