//: [Previous](@previous)

//: # Functions
//: Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function’s return type.
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
//: > Prior to Swift 3, the first parameter name was not required.  Pay attentiont to this when looking
//: > through tutorials.

// Run the function and assigne the return variable
let myReturnedString = greet(name: "Betty", day: "Monday")

//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
//:
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
        max = score
    } else if score < min {
        min = score
        }
        sum += score
    }
    // Combine the calculated values in a tuple to 
    // pass multiple vales back
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

print(statistics.sum)
print(statistics.2)


//: [Next](@next)
