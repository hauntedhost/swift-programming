//
//  main.swift
//  ProtocolExtensions
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

// calories burned generic function
func caloriesBurnedPerMinute<E: Exercise>(for exercise: E) -> Double {
  return exercise.caloriesBurned / exercise.minutes
}

let ew = EllipticalWorkout(caloriesBurned: 132, minutes: 19)
let tw = TreadmillWorkout(caloriesBurned: 320, minutes: 27, laps: 4)

print("ew.description: \(ew.description)")
print("tw.description: \(tw.description)")

print("ew.caloriesBurnedPerMinute: \(ew.caloriesBurnedPerMinute)")
print("caloriesBurnedPerMinute(ew): \(caloriesBurnedPerMinute(for: ew))")

let exercises: [Exercise] = [ew, tw]
print("exercises.totalCaloriesBurned(): \(exercises.totalCaloriesBurned())")

