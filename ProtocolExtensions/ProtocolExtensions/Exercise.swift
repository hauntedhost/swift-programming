//
//  Exercise.swift
//  ProtocolExtensions
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

protocol Exercise: Describable {
  var name: String { get }
  var caloriesBurned: Double { get }
  var minutes: Double { get }
}

// protocol extension for calories burned as computed property
extension Exercise {
  var caloriesBurnedPerMinute: Double {
    return caloriesBurned / minutes
  }
}

// extend exercise to conform to Describable protocol by adding default
// implementation of description
extension Exercise {
  var description: String {
    return [
      "Exercise \(name) burned \(caloriesBurned) calories",
      "in \(minutes) minutes.",
    ].joined(separator: " ")
  }
}

// extending sequences containing Exercise elements
extension Sequence where Iterator.Element == Exercise {
  func totalCaloriesBurned() -> Double {
    return self.reduce(0) { $0 + $1.caloriesBurned }
  }
}
