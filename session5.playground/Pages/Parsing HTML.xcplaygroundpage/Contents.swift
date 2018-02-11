import Foundation
import PlaygroundSupport
import UIKit

//XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let string = "<h1>This is <b>html</b>.</h1>"
print(string)

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 100))
label.text = string
label.numberOfLines = 3

///: Use regular expression to strip out the html tags
///: This leaves some of the markup.
let regex = try! NSRegularExpression(pattern: "<.*?>", options: [.caseInsensitive])
let range = NSMakeRange(0, string.count)
let htmlLessString :String = regex.stringByReplacingMatches(in: string, options: [],
  range:range ,
  withTemplate: "")
print(htmlLessString)
