//
//  main.swift
//  Extensions
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

typealias Velocity = Double

extension Velocity {
  var kph: Velocity { return self * 1.60934 }
  var mph: Velocity { return self }
}

protocol Vehicle {
  var topSpeed: Velocity { get }
  var numberOfDoors: Int { get }
  var hasFlatBed: Bool { get }
}

struct Car {
  let make: String
  let model: String
  let year: Int
  let color: String
  let nickname: String
  var gasLevel: Double {
    willSet(newLevel) {
      assert(newLevel <= 1.0 && newLevel >= 0.0, "Level must be between 0 and 1")
    }
  }
}

// extend the Car struct to conform to the Vehicle protocol
extension Car: Vehicle {
  var topSpeed: Velocity { return 180 }
  var numberOfDoors: Int { return 4 }
  var hasFlatBed: Bool { return true }
}

// struct can be extended with init and keep default memberwise init
extension Car {
  init(make: String, model: String, year: Int) {
    self.init(
      make: make,
      model: model,
      year: year,
      color: "Black",
      nickname: "\(year) \(make) \(model)",
      gasLevel: 1.0
    )
  }
}

// add enum to Car via extension
extension Car {
  enum Kind {
    case coupe, sedan, truck
  }
  var kind: Kind {
    if numberOfDoors == 2 {
      return .coupe
    } else {
      return .sedan
    }
  }
}

// add functions to Car via extension
extension Car {
  mutating func emptyGas(by amount: Double) {
    assert(amount <= 1 && amount > 0, "Amount must be between 0 and 1")
    gasLevel -= amount
  }

  mutating func fillGas() {
    gasLevel = 1.0
  }
}

var car = Car(make: "Ford", model: "Mustang", year: 1981)
print(car)
print(car.kind)

car.emptyGas(by: 0.59)
print("gas level: \(car.gasLevel)")
car.fillGas()
print("gas level: \(car.gasLevel)")

