import Cocoa

// declare and initialize a string
var greeting: String = "Hello, playground"
greeting += "!"

// declare and initialize an integer
var espressoShots: Int = 3
espressoShots += 1

// explicit typing in string vs interpolation
var orderMessage: String
orderMessage = "Cortado with " + String(espressoShots) + " shots please"
orderMessage = "Cortado with \(espressoShots) shots please"

// declare uninitialized integer, then assign value
var townPopulation: Int
townPopulation = 87_236

var townNumStopLights = 422

// declare and set a constant
let townName: String = "Asheville"
let townDescription: String =
  "\(townName) has pop of \(townPopulation) and \(townNumStopLights) stop lights."
print(townDescription)

// testing equality
let messageOne = "hello"
let messageTwo = "hello"
let messageEquality = messageOne == messageTwo

// array on strings
let animals: [String] = [
  "sebastian",
  "castle",
]

// for loops
for animal in animals {
  print("animal: \(animal)")
  if animal == "sebastian" {
    print("hello sebastian!")
  }
}

// optionals
var optionalName: String?
print(optionalName == nil)
if let name = optionalName {
  print("1. Hello, \(name)")
}

optionalName = "sean"
if let name = optionalName {
  print("2. Hello, \(name)")
}
// note: `name` does not exist outside of previous `if let` scope

// switch pattern matching ftw
let vegetable = "red pepper"
switch vegetable {
case "celery":
  print("are you a rabbit?")
case "cucumber", "pickle":
  print("mmmmm")
case let x where x.hasSuffix("pepper"):
  print("is it spicy?")
default:
  print("throw it in a soup")
}

// dictionary
let interestingNumbers: [String:[Int]] = [
  "Prime": [2, 3, 5, 7, 11, 13],
  "Fibonacci": [1, 1, 2, 3, 5, 8],
  "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (kind, numbers) in interestingNumbers {
  for number in numbers {
    if number > largest {
      largest = number
    }
  }
}
print("largest: \(largest)")

// range
var total: Int = 0
for i in 0..<4 {
  total += i
}
print("total: \(total)")

// named arguments
func greet(person: String, day: String) -> String {
  return "Hello \(person), today is \(day)"
}

print(greet(person: "Sean", day: "Wednesday"))

func greet(_ person: String, _ day: String) -> String {
  return "Hello \(person), today is \(day)"
}
print(greet("Sean", "Wednesday"))

// higher order functions
func makeAdder(_ a: Int) -> ((Int) -> Int) {
  func add(_ b: Int) -> Int {
    return a + b
  }
  return add
}

let addFive = makeAdder(5)
print(addFive(10))

// lets use this in anonymous functions
func hasAnyMatches(_ list: [Int], _ condition: (Int) -> Bool) -> Bool {
  for item in list {
    if condition(item) {
      return true
    }
  }
  return false
}

let numbers = [5, 10, 20]
let hasAny = hasAnyMatches(numbers, { $0 == 5 })
print(hasAny)

// (at least) three syntaxes to anonymous functions
print(numbers.map({ (num: Int) -> Int in return num * num }))
print(numbers.map({ num in num * num }))
print(numbers.map({ $0 * $0 }))

// unicode hell yah
let 夜猫子 = "night owl"

// operator functions
prefix operator √
prefix func √ (_ num: Double) -> Double {
  return sqrt(num)
}
print(√(3))

// classes
class Shape {
  let name: String
  let numberOfSides: Int

  init(numberOfSides: Int) {
    self.name = "\(type(of: self))"
    self.numberOfSides = numberOfSides
  }

  func description() -> String {
    return "A \(name) with \(numberOfSides) sides."
  }
}

class Square: Shape {
  let sideLength: Double

  init(sideLength: Double) {
    self.sideLength = sideLength
    super.init(numberOfSides: 4)
  }

  override func description() -> String {
    let parentDescription = super.description()
    return "\(parentDescription) Each side has length \(sideLength)."
  }
}

var shape = Square(sideLength: 9)
print(shape.name)
print(shape.description())

// inheritance very serious business
class 😐 {
  let emoji: String
  var name = "Neutral"

  init() {
    emoji = "\(type(of: self))"
  }

  func description() -> String {
    return "A \(name) face: \(emoji)"
  }
}

class 🤓: 😐 {
  override init() {
    super.init()
    name = "Nerd"
  }

  override func description() -> String {
    return "A nerd face inherited from a neutral face obviously: \(emoji)"
  }
}

let neutral = 😐()
print(neutral.description())

let nerd = 🤓()
print(nerd.description())

// whoah. property getter/setters
class PerfectTriangle {
  var sideLength: Double

  init(sideLength: Double) {
    self.sideLength = sideLength
  }

  var perimeter: Double {
    get {
      return sideLength * 3.0
    }
    set(perimeterValue) {
      sideLength = perimeterValue / 3.0
    }
  }
}

let triangle = PerfectTriangle(sideLength: 9)
print("triangle.sideLength: \(triangle.sideLength)")
triangle.perimeter = 5
print("triangle.sideLength: \(triangle.sideLength)")

// modulo
infix operator %%
func %%(_ num: Int, _ mod: Int) -> Int {
  let remain = num % mod
  return remain >= 0 ? remain : remain + mod
}
print(-1 %% 4)
print(-6 %% 4)
