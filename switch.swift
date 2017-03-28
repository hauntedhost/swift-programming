import Foundation

// // switch is not an expression  (╯°□°）╯︵ ┻━┻
// let errorCode: Int = 404
// let errorMessage: String = switch errorCode {
// case 400:
//   "Bad Request"
// case 401:
//   "Unauthorized"
// case 422:
//   "Unprocessable Entity"
// default:
//   "Unknown"
// }

let errorCode: Int = 404
var errorMessage: String
switch errorCode {
case 400:
  errorMessage = "Bad Request"
case 401:
  errorMessage = "Unauthorized"
case 422:
  errorMessage = "Unprocessable Entity"
default:
  errorMessage = "Unknown"
}

// this is as good as it's gonna get
func getErrorMessage(_ errorCode: Int) -> String {
  switch errorCode {
  case 400:
    return "Bad Request"
  case 401:
    return "Unauthorized"
  case 422:
    return "Unprocessable Entity"
  default:
    return "Unknown"
  }
}

print("getErrorMessage(404): \(getErrorMessage(404))")

func getStatusMessage(_ statusCode: Int) -> String {
  switch statusCode {
  case 100...102:
    return "Informational"
  case 200...208, 226:
    return "Success"
  case 300...308:
    return "Redirection"
  case 400...418, 421...424, 426, 428, 429, 431, 451:
    return "Client error"
  case 500...508, 510, 511:
    return "Server error"
  default:
    return "\(statusCode) is not a known status code"
  }
}

print("getStatusMessage(201): \(getStatusMessage(201))")
print("getStatusMessage(404): \(getStatusMessage(404))")
print("getStatusMessage(500): \(getStatusMessage(500))")
print("getStatusMessage(999): \(getStatusMessage(999))")
