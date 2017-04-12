//
//  Town.swift
//  MonsterTown
//
//  Created by sean on 3/29/17.
//

import Foundation

struct Town {
  // constants
  let region: String
  let name: String

  // variables
  var numberOfStoplights: Int
  var mayor: Mayor?
  
  // instance variable with `didSet` property observer
  var population: Int {
    didSet(oldPopulation) {
      if population < oldPopulation {
        print("Oh no! \(name) just lost \(oldPopulation - population) citizens")
      } else {
        print("\(name) gained \(population - oldPopulation) citizens")
      }
    }
  }

  // enum nested in town
  enum Size {
    case small
    case medium
    case large
  }

  // variable with getter
  var townSize: Size {
    get {
      switch self.population {
      case 0...10_000:
        return Size.small
      case 10_001...100_000:
        return Size.medium
      default:
        return Size.large
      }
    }
  }

  init(
    region: String,
    name: String,
    population: Int,
    mayor: Mayor?,
    stoplights: Int
  ) {
    self.region = region
    self.name = name
    self.population = population
    self.mayor = mayor
    self.numberOfStoplights = stoplights
  }

  init(
    name: String,
    population: Int,
    stoplights: Int
  ) {
    self.init(
      region: "N/A",
      name: name,
      population: population,
      mayor: nil,
      stoplights: stoplights
    )
  }

  func printDescription() {
    print([
      "The town of \(name) is \(townSize)",
      "with a population of \(population)",
      "and \(numberOfStoplights) stop lights"
    ].joined(separator: " "))
  }

  mutating func changePopulation(by amount: Int) {
    population += amount
    if population < 0 {
      population = 0
    }

    // notify mayor we've lost some folks
    if amount < 0, let mayor = mayor {
      mayor.notifyOfLoss(to: self)
    }
  }
}
