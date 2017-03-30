// first function dawg
func printGreeting() {
  print("hello world!")
}
printGreeting()

// naming guidelines suggest putting preposition (i.e. "to")
// in the function parameters when the function only takes one parameter
func printPersonGreeting(to name: String) {
  print("hello \(name)")
}
printPersonGreeting(to: "sean")

// naming guidelines suggest putting preposition (i.e. "for")
// in the function *name* when the function takes multiple parameters
func printDivDescriptionFor(num: Double, denom: Double) {
  print("\(num) divided by \(denom) equals \(num / denom)")
}
printDivDescriptionFor(num: 10, denom: 2.5)

// variadic parameters
func printPersonGreetings(to names: String...) {
  for name in names {
    printPersonGreeting(to: name)
  }
}
printPersonGreetings(to: "sean")
printPersonGreetings(to: "alli", "castle")

func printSentence(words: String..., withPunctuation: String = ".") {
  let sentence = words.joined(separator: " ") + withPunctuation
  print(sentence)
}
printSentence(words: "hi", "there", "swift")
printSentence(words: "i", "said", "hello", "there", "swift", withPunctuation: "!!")

// mutable parameter references, oof
func appendErrorCode(_ errorCode: Int, toErrorString errorString: inout String) {
  switch errorCode {
  case 400:
    errorString += "Bad Request"
  case 401:
    errorString += "Unauthorized"
  case 422:
    errorString += "Unprocessable Entity"
  default:
    errorString += "Unknown Error"
  }
}
var error = "The request failed: "
appendErrorCode(400, toErrorString: &error)
print("error: \(error)")

// return the things
func divDescriptionFor(num: Double, denom: Double) -> String {
  return "\(num) divided by \(denom) equals \(num / denom)"
}
print(divDescriptionFor(num: 10, denom: 2.5))

// nested functions, closures
func areaOfTriangleWith(base: Double, height: Double) -> Double {
  let numerator = base * height
  func divide() -> Double {
    return numerator / 2
  }
  return divide()
}
let area = areaOfTriangleWith(base: 5, height: 10)
print("area: \(area)")

// multiple returns via tuple
func splitEvenOdd(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
  var evens: [Int] = []
  var odds: [Int] = []
  for number in numbers {
    if number % 2 == 0 {
      evens.append(number)
    } else {
      odds.append(number)
    }
  }
  return (evens, odds)
}
// function type signature
let splitEvenOddFunction: ([Int]) -> ([Int], [Int]) = splitEvenOdd
let sorted = splitEvenOdd([1, 10, 3, 2, 9, -15, 16, 18, 23])
print("sorted: \(sorted)")
print("evens: \(sorted.evens)")
print("odds: \(sorted.odds)")

// optional return value
func middleNameFrom(_ name: (first: String, middle: String?, last: String)) -> String? {
  return name.middle
}
var maybeMiddleName = middleNameFrom(("Sean", nil, "Omlor"))
if let middleName = maybeMiddleName {
  print("middleName1: \(middleName)")
} else {
  maybeMiddleName = middleNameFrom(("Sean", "Everett", "Omlor"))
  if let middleName = maybeMiddleName {
    print("middleName2: \(middleName)")
  }
}

// function guards for early return
func greetBymiddleName(_ name: (first: String, middle: String?, last: String)) {
  guard let middleName = name.middle else {
    print("hello, uhhh, you.")
    return
  }
  print("hey \(middleName)!")
}
greetBymiddleName(("sean", nil, "omlor"))
greetBymiddleName(("sean", "everett", "omlor"))

// filter the beans
func siftBeans(from groceries: [String]) -> [String] {
  return groceries.filter { $0.hasSuffix("beans") }
}
let groceries = [
  "apples",
  "chocolate",
  "jellybeans",
  "milk",
  "coffee beans",
  "bacon",
  "green beans",
  "salsa",
  "black beans",
]
print("beans: \(siftBeans(from: groceries))")

// into the void
func sayHello1() {
  print("hello!")
}
func sayHello2() -> Void {
  print("hello!")
}
func sayHello3() -> () {
  print("hello!")
}
let void = sayHello1()
print("void: \(void)")
