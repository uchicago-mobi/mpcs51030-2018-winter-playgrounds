//: [Previous](@previous)

//: # Optionals

import Foundation

//: In the Objective-C runtime, messaging nil returns nil, which means the null pointer is effectively safe. However, this doesn’t particularly help you if you’re expecting the reference to be non-nil. The usual way around this is to do an assertion check that the variable is never nil. In debug mode, your app would crash if it encounters nil, so you can find the bug and fix it before releasing the code.

//: When you do need the nil value, you can use an optional. Optionals are a way of wrapping up the concept of “has a value” or “may have a value” into a language-wide feature.


// Declare an optional (the default value is `nil`)
var device: String?
print(device ?? "Can't find device")

// Declare an optinal and assign it a value
var phone: String?
var pad: String? = "iPad 2"

// The value type is 'optional'
print(phone)
//: Need to **unwrap** the value of the optional.  Unwrapping using `if-let` assigns the value to a new constant.  If the optional value is nil, the conditional is false and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.
// If there is a value associated with unwrappedPhone, assign that value
// to unwrappedPhone
if let unwrappedPhone = phone {
    print("The unwrapped value of phone is: \(unwrappedPhone)")
}
//:Conditional binding enables you to apply a cast, test the resulting optional, and then bind unwrapped values to a local variable.

// Unwrap multiple values at the same time
if let unwrappedPad = pad,
  let unwrappedPhone = phone {
  print("The unwrapped value of phone is: \(unwrappedPhone)")
}

// You can also then bind unwrapped values to a local variable.
// This can be confusing.
if let phone = phone {
    print("The unwrapped value of phone is: \(phone)")
}
print(phone)


//: ## Thinking About Optionals
//: When you are using optionals, you are asking a series of question:
//:  - Is the value `nil`?
//:  - If yes, then do something
//:  - If no, then unwrap it and copy the value to a new constant
//: This makes handling `nil` value safe.  There are many classes in `UIKit` that may return `nil`.  For example a `UIView` may return `nil` if it is not instantiated correctly.  It would not have mattered that much in Objective-C since you could still safely send messages to the `nil` instance (e.g. [view setBackgroundColor]).

//: ## Coalescing operator
//: Swift's `nil`-coalescing operator `??` unwraps optionals and provides fallback values for the `nil` case. This next example checks uses `nil`-coalescing to assign a value to the sound constant:
var soundDictionary = [String:String]()
let sound = soundDictionary["fox"] ?? "unknown"
//: If the lookup succeeds and the dictionary returns a wrapped value, the operator unwraps it and assigns it to sound. If not, it assigns the fallback value, which is "unknown". In either case, the assignment is not optional. sound uses a String type, not String?.

//: > In practice, you will not see this very much since it undermines the designation of an optional type

//: ## Forced unwrapping
//: If you already know that a particular optional contains a value, then you can use what is known as forced unwrapping. This means you don’t need the if statement to check if the optional contains a value.

var optionalString: String? = "Hello World!"
print("Force unwrapped! \(optionalString!.uppercased())")

//: This is convienent, but elimates the safety design of Swift
//: ## Implicit unwrapping
var optionalString2: String! = "Hello World!"
print("Implicit unwrapped! \(optionalString2.uppercased())")

//: ## Optional Chaining
//: Optional chaining is a concise way to work with optionals quickly without using if/let and a conditional block each time.

var maybeString: String?

// If `maybeString` is not `nil` then `.uppercaseString` will be evaluated.  If it is `nil`, it will return `nil`

let uppercase = maybeString?.uppercased()


//: [Next](@next)
