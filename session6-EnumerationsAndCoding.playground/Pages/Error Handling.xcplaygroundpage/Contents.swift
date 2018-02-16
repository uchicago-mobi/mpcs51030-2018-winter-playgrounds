import Foundation

// Custom Error Type
enum DivisionError: Error {
  case divideByZero
}



func safeDivision(numerator: Double, denominator: Double) throws -> Double {
  if denominator == 0 {
    throw DivisionError.divideByZero
  }
  return numerator/denominator
}




do {
  let result = try safeDivision(numerator: 10, denominator: 2)
  print("Answer: \(result)")
} catch is DivisionError {
  print("Error!!")
}

