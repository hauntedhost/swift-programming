//: Playground - noun: a place where people can play

import Cocoa

// declare and initialize a string
var greeting: String = "👻 Hello, playground"
greeting += "!"

// declare and initialize an integer
var espressoShots: Int = 3
espressoShots += 1

// explicit typing in string vs interpolation
var orderMessage: String
orderMessage = "Cortado with " + String(espressoShots) + " shots please"
orderMessage = "Cortado with \(espressoShots) shots please"

// declare uninitialized integer, then assign value
var townPopulation: Int
townPopulation = 87_236

var townNumStopLights = 422

// declare and set a constant
let townName: String = "Asheville"

let townDescription =
  "\(townName) has a population of \(townPopulation) and \(townNumStopLights) stop lights."

// unicode string index shenanigans
let startIndex = greeting.startIndex
let charIndex = greeting.index(startIndex, offsetBy: 6)
greeting[charIndex]
greeting[startIndex...charIndex]

// for in loop visuals
for i in 1...100 where i % 2 == 0 {
  sin(Double(i))
  tan(Double(i))
}
