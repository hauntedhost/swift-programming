//
//  IntStack.swift
//  Generics
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct IntStack {
  var items: [Int] = []

  mutating func push(_ newItem: Int) {
    items.append(newItem)
  }

  mutating func pop() -> Int? {
    guard !items.isEmpty else {
      return nil
    }
    return items.removeLast()
  }
}
