//
//  main.swift
//  ProtocolExtensions
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

protocol Exercise {
  var name: String { get }
  var caloriesBurned: Double { get }
  var minutes: Double { get }
}

// calories burned generic function
func caloriesBurnedPerMinute<E: Exercise>(for exercise: E) -> Double {
  return exercise.caloriesBurned / exercise.minutes
}

// protocol extension for calories burned as computed property
extension Exercise {
  var caloriesBurnedPerMinute: Double {
    return caloriesBurned / minutes
  }
}

struct EllipticalWorkout: Exercise {
  let name = "Elliptical Workout"
  let caloriesBurned: Double
  let minutes: Double
}

struct TreadmillWorkout: Exercise {
  let name = "Treadmill Workout"
  let caloriesBurned: Double
  let minutes: Double
  let laps: Double
}

let ew = EllipticalWorkout(caloriesBurned: 132, minutes: 19)
let tw = TreadmillWorkout(caloriesBurned: 320, minutes: 27, laps: 4)

print("ew.caloriesBurned: \(ew.caloriesBurnedPerMinute)")
print("caloriesBurnedPerMinute(ew): \(caloriesBurnedPerMinute(for: ew))")


