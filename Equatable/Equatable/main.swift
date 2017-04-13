//
//  main.swift
//  Equatable
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct Point {
  let x: Int
  let y: Int
}

extension Point: Equatable {
  static func ==(left: Point, right: Point) -> Bool {
    return left.x == right.x && left.y == right.y
  }
}

extension Point: Comparable {
  static func <(left: Point, right: Point) -> Bool {
    return left.x < right.x && left.y < right.y
  }
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let c = Point(x: 9, y: 4)

// Equatable

print("a == b: \(a == b)")
print("a == c: \(a == c)")

// != for free
print("a != c: \(a != c)")

// Comparable

print("a < c: \(a < c)")
print("c > a: \(c > a)")

// woot
print("a >= b: \(a >= b)")



