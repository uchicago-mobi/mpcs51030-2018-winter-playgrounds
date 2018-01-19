//: [Previous](@previous)

import Foundation
import UIKit

//: # Foundation 
//: --------------------
//: The Foundation framework provided many of the essentail data types and collection functions
//: that powered Obj-C.  These same functions are available to Swift through Swift-ObjC bridging. 
//: The Swift roadmap aims to provide all the Foundation functions as part of the Swift standard
//: library.


//: ## Logging

// Define a constant string
let dog: String = "Snoopy"

// String interpolation `\(variable)` evaluates a variable
// inside of of a print statement
print("Print: Charlie Brown has a dog named \(dog)")

// Foundation's `NSLog` prints to the console.  Note that
// it does not print to the
NSLog("NSLog: Charlie Brown has a dog named %@",dog)


//: # Swift vs. Foundation
//: --------------------
//: The Swift standard library provides functions that are not in Foundation.
var greeting = "Hello from Swift"

// Make it more exciting using an exclusive Swift `String` API
greeting.append("!")

// Make it more exciting for 2016 using a Foundation NSString API
greeting.replacingOccurrences(of: "!", with: "😀🐼")

// Make it more exciting for the snapchat generation
let image = UIImage(named:"swift.jpg")



//: [Next](@next)


