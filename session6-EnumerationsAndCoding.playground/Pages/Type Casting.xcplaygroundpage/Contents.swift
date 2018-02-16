

import Foundation


class Genre {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Classical : Genre {
}

class Pop : Genre {
}

var collection = [
  Pop(name: "Hard Day's Night"),
  Classical(name: "Canon in D"),
]

//: Use is to check instance of.

for song in collection {
  if song is Classical {
    print("\(song.name) is classical!")
  } else if song is Pop {
    print("\(song.name) is poppy!")
  }
}

// Hard Day's Night is poppy!
// Canon in D is classical!



