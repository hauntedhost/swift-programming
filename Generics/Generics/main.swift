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


