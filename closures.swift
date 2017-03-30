let coolNumbers: [Double] = [73, 1.618, 1089, 1729, 3.14159]

// using named function
func sortAscending(_ a: Double, _ b: Double) -> Bool {
  return a < b
}
let sorted1 = coolNumbers.sorted(by: sortAscending)

// verbose anonymous function
let sorted2 = coolNumbers.sorted(by: {
  (a: Double, b: Double) -> Bool in return a < b
})

// type inference
let sorted3 = coolNumbers.sorted(by: { a, b in return a < b })

// shorthand argument syntax
let sorted4 = coolNumbers.sorted(by: { $0 < $1 })

// inline trailing closure
let sorted5 = coolNumbers.sorted { $0 < $1 }

print("sorted1 (named function): \(sorted1)")
print("sorted2 (anonymous typed): \(sorted2)")
print("sorted3 (anonymous inference): \(sorted3)")
print("sorted4 (anonymous shorthand): \(sorted4)")
print("sorted5 (anonymous inline): \(sorted5)")

// functions as return values
func makeAdder(_ a: Int) -> (Int) -> Int {
  func adder(_ b: Int) -> Int {
    return a + b
  }
  return adder
}
let addFive = makeAdder(5)
print("addFive(10): \(addFive(10))")

// functions as arguments
func mapNums(_ list: [Int], _ fn: (Int) -> Int) -> [Int] {
  var result: [Int] = []
  for item in list {
    result.append(fn(item))
  }
  return result
}
let squares = mapNums([2, 3, 4], { $0 * $0 })
print("squares: \(squares)")

// closures are reference types
func makeCounter(_ initial: Int = 0) -> () -> Int {
  var count = initial
  func counter() -> Int {
    count += 1
    return count
  }
  return counter
}
let myCounter = makeCounter()
var myCount: Int
myCount = myCounter()
myCount = myCounter()
print("myCount: \(myCount)")

let otherCounter = myCounter
var otherCount: Int
otherCount = myCounter()
otherCount = myCounter()
print("otherCount: \(otherCount)")

myCount = myCounter()
print("myCount: \(myCount)")

// map
let books = [
  "Topoi",
  "Conceptual Mathematics",
  "Combinatorial Problems",
]

let booksLower = books.map { $0.lowercased() }
print("books: \(books)")
print("booksLower: \(booksLower)")

// filter
let numbers = Array(1...25)
let evens = numbers.filter { $0 % 2 == 0 }
print("numbers: \(numbers)")
print("evens: \(evens)")

// reduce
let sum = numbers.reduce(0) { $0 + $1 }
print("sum: \(sum)")

// imperative charCount
func charCount(_ string: String) -> [Character:Int] {
  var result: [Character:Int] = [:]
  for char in Array(string.characters) {
    if let count = result[char] {
      result[char] = count + 1
    } else {
      result[char] = 1
    }
  }
  return result
}
let string = "hellooo"
print("charCount: \(charCount(string))")

// reduce with helper function
func incChar(_ acc: [Character:Int], _ char: Character) -> [Character:Int] {
  var result = acc
  if let count = result[char] {
    result[char] = count + 1
  } else {
    result[char] = 1
  }
  return result
}

func charCountReduce(_ string: String) -> [Character:Int] {
  let characters = Array(string.characters)
  return characters.reduce([Character:Int](), incChar)
}
print("charCountReduce: \(charCountReduce(string))")

// reduce inline
func charCountReduce2(_ string: String) -> [Character:Int] {
  let characters = Array(string.characters)
  return characters.reduce([Character:Int]()) { acc, char in
    var result = acc
    if let count = result[char] {
      result[char] = count + 1
    } else {
      result[char] = 1
    }
    return result
  }
}
print("charCountReduce2: \(charCountReduce2(string))")
