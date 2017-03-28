import Foundation

// optional string
var maybeErrorMessage: String?

// optional chaining
if let message = maybeErrorMessage {
  print(message)
} else {
  print("no error")
}

// nil coalescing operator
let errorMessage = maybeErrorMessage?.uppercased() ?? "NO ERROR"
print(errorMessage)

// (safely) modifying optional in place
if let message = maybeErrorMessage?.append(" - try again") {
  print(message)
}

maybeErrorMessage = "fiery explosions"
if let message = maybeErrorMessage?.uppercased() {
  print("\(message)!")
}
