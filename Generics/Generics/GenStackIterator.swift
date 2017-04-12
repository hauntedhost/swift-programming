//
//  GenStackIterator.swift
//  Generics
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct GenStackIterator<T>: IteratorProtocol {
  typealias Element = T

  var stack: GenStack<T>

  mutating func next() -> Element? {
    return stack.pop()
  }
}
