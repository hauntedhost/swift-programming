//
//  main.swift
//  Generics
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

func printOptional(_ thing: Any?) {
  if let thing = thing {
    print("Optional(\(thing))")
  } else {
    print("nil")
  }
}

var intStack = IntStack()
intStack.push(5)
intStack.push(10)

printOptional(intStack.pop())
printOptional(intStack.pop())
printOptional(intStack.pop())

var intStack2 = GenStack<Int>()
intStack2.push(3)
intStack2.push(6)

printOptional(intStack2.pop())
printOptional(intStack2.pop())
printOptional(intStack2.pop())

var stringStack = GenStack(["sean", "alli"])
stringStack.push("castle")
stringStack.push("sebastian")
printOptional(stringStack.pop())


// generic functions

func myMap<T, U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
  var result: [U] = []
  for item in items {
    result.append(f(item))
  }
  return result
}

var charCounts = myMap(["sean", "alli", "castle", "sebastian"]) {
  $0.characters.count
}
print(charCounts)

// generic methods

stringStack.push("sebastian")
print(stringStack.map { $0.uppercased() })

// type constraint by subclass

func checkIfEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
  return a == b
}

print(checkIfEqual(42, 42))
print(checkIfEqual("foo", "foo"))
print(checkIfEqual(true, false))

// type constraint by protocol

protocol Describable {
  var description: String { get }
}

struct Person: Describable {
  let name: String
  let city: String

  var description: String {
    return "\(name) lives in \(city)"
  }
}

struct Animal: Describable {
  let name: String
  let city: String

  var description: String {
    return "\(name) lives in \(city)"
  }
}

func descriptionsMatch<T: Describable, U: Describable>(_ a: T, _ b: U) -> Bool {
  return a.description.lowercased() == b.description.lowercased()
}

let animal = Animal(name: "Castle", city: "asheville")
let person = Person(name: "castle", city: "Asheville")
print("descriptionsMatch(animal, person) -> \(descriptionsMatch(animal, person))")

