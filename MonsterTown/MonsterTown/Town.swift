//
//  Town.swift
//  MonsterTown
//
//  Created by sean on 3/30/17.
//  Copyright © 2017 MetaTree. All rights reserved.
//

import Foundation

struct Town {
  var name = "TownyTown"
  var population = 5_422
  var numberOfStopLights = 4
  
  func printDescription() {
    print("The town of \(name) has a population of \(population) and \(numberOfStopLights) stop lights")
  }
  
  mutating func changePopulation(by amount: Int) {
    population += amount
    if population < 0 {
      population = 0
    }
  }
}
