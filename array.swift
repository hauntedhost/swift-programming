import Foundation

// declare and initialize fruits array
var fruits: [String] = []

// append some things
fruits.append("orange")
fruits.append("pear")
fruits.append("banana")

// remove, replace, insert at, concat
fruits.remove(at: 0)
fruits[0] = "mango"
fruits.insert("noni", at: 1)
fruits += ["blueberry", "strawberry"]

print("fruits.count: \(fruits.count)")
print("fruits[0]: \(fruits[0])")
print("fruits: \(fruits)")
print("fruits[1...fruits.count - 1]: \(fruits[1...fruits.count - 1])")

let isEqual = fruits == ["mango", "noni", "banana", "blueberry", "strawberry"]
print("isEqual: \(isEqual)")

print("[].isEmpty: \([].isEmpty)")
print("fruits.isEmpty: \(fruits.isEmpty)")

if let berryIndex = fruits.index(where: { $0.hasSuffix("berry") }) {
  print("berryIndex: \(berryIndex)")
}

func isBerry(_ fruit: String) -> Bool {
  return fruit.hasSuffix("berry")
}

if let berryIndex = fruits.index(where: isBerry) {
  print("berryIndex: \(berryIndex)")
}
