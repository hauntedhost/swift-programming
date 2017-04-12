//
//  Monster.swift
//  MonsterTown
//
//  Created by sean on 3/29/17.
//

import Foundation

class Monster {
  // static class constant
  static let isScary = true

  // class variable, overridable by subclasses
  class var spookyNoise: String {
    return "Grrrrrrrr..."
  }

  // instance variables
  var name: String
  var town: Town?
  var numAttacks = 0

  // instant variable with getter and setter
  var victimPool: Int {
    get {
      return town?.population ?? 0
    }
    set(newVictimPool) {
      town?.population = newVictimPool
    }
  }

  init(name: String, town: Town?) {
    self.name = name
    self.town = town
  }

  // instance function
  func makeSpookyNoise() {
    print("The \(name) monster speaks! \(type(of: self).spookyNoise)")
  }

  func terrorizeTown() {
    if var town = town {
      numAttacks += 1
      print("The \(name) monster is terrorizing the town of \(town.name) [\(numAttacks)]")
      town.changePopulation(by: -33)
    } else {
      print("The \(name) monster hasn't found a town to terrorize yet")
    }
  }

  func move(to newTown: inout Town) {
    town = newTown
  }
}
