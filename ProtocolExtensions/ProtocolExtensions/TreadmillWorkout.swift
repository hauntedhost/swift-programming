//
//  TreadmillWorkout.swift
//  ProtocolExtensions
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct TreadmillWorkout: Exercise {
  let name = "Treadmill Workout"
  let caloriesBurned: Double
  let minutes: Double
  let laps: Double
}

// override Exercise's default implementation of Describable
extension TreadmillWorkout {
  var description: String {
    return [
      "Exercise \(name) burned \(caloriesBurned) calories",
      "and \(laps) laps",
      "in \(minutes) minutes.",
    ].joined(separator: " ")
  }
}
