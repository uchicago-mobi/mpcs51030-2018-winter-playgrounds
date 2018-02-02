//: # Singleton Pattern #
//:
//: The singleton pattern defnes an object which is instantiated exactly once. For the entirety of your application, only a single copy of this object exists and the state is shared and reachable by any other object.  _The use of the singleton pattern is contentious._  For interesting debate on both sides read through these references:
//:
//:  - [Apple Documentation](https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/Singleton.html)
//: - [ObjC.io Singleton Article](http://www.objc.io/issue-13/singletons.html)
//:  - [The Right Way to Write a Singleton](http://krakendev.io/blog/the-right-way-to-write-a-singleton)

//: There are differnt approaches to implement the pattern in Swift and, while they all perform the objective, the most agreed upon implementation is described [here](http://krakendev.io/blog/the-right-way-to-write-a-singleton).

import Foundation

class SoundManager {
  
  // Static class variable
  static let sharedInstance = SoundManager()
  
  /// This prevents others from using the default '()' initializer for this class.
  private init() {}
  
  /// Play a sound
  func playSound() {
    print("Beep")
  }
  
  /// Play named sound
  /// - Parameter named: `String` representing a sound file
  func playSound(named: String) -> Bool {
    print("Playing sound named: \(named)")
    return true
  }
}

//:
//: ## To use the class you would invoke a methods as follows:##
//:

// Call a function on the singleton instance
SoundManager.sharedInstance.playSound()

// Call the singleton instance while passing a variable and returing a value
let soundPlayed = SoundManager.sharedInstance.playSound(named: "Tink")
let anotherSound = SoundManager.sharedInstance.playSound(named: "Beep")
let yetAnotherSound = SoundManager.sharedInstance.playSound(named: "Bloop")


//:> An advatage of using this pattern here is that any overhead in "setting up" playing a sound is only experienced the first time it is run.  Every other time the function is called, it uses the existing instance.  For example, if "Tink" will only be have to loaded in memory one time even though the sound is played over and over again.


//:The singleton pattern can be an important pattern in your iOS toolbox.  Hopefully, this will help you to see some of the advantages (and disadvantages) of this pattern.  Apple uses this pattern extensively in UIKit, so take that into consideration before you form your opinion.
