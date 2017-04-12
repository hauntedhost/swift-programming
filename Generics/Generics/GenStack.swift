//
//  GenStack.swift
//  Generics
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct GenStack<Element> {
  var items: [Element] = []

  mutating func push(_ newItem: Element) {
    items.append(newItem)
  }

  mutating func pushAll<S: Sequence>(_ sequence: S)
  where S.Iterator.Element == Element {
    for item in sequence {
      self.push(item)
    }
  }

  mutating func pop() -> Element? {
    guard !items.isEmpty else {
      return nil
    }
    return items.removeLast()
  }

  func map<U>(_ f: (Element) -> U) -> [U] {
    var result: [U] = []
    for item in items {
      result.append(f(item))
    }
    return result
  }

  func filter(_ f: (Element) -> Bool) -> [Element] {
    var result: [Element] = []
    for item in items {
      if f(item) {
        result.append(item)
      }
    }
    return result
  }
}

extension GenStack {
  init(_ elements: [Element]) {
    self.items = elements
  }
}

extension GenStack: Sequence {
  func makeIterator() -> GenStackIterator<Element> {
    return GenStackIterator(stack: self)
  }
}
