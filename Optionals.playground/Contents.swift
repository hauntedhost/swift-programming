//: Playground - noun: a place where people can play

import Foundation

// forced unwrapping
let errorMessage: String? = "404"
errorMessage!

//// optional binding
let maybeErrorMessage: String? = "404"
if let errorMessage = maybeErrorMessage {
  errorMessage
}

// multiple optional binding
let maybeError: String? = "404"
if let errorMessage = maybeError, let errorCode = Int(errorMessage) {
  switch errorCode {
  case 400...499:
    print("Not found")
  default:
    print(errorMessage)
  }
}
