//
//  Zombie.swift
//  MonsterTown
//
//  Created by sean on 3/30/17.
//  Copyright © 2017 MetaTree. All rights reserved.
//

import Foundation

class Zombie: Monster {
  var walksWithLimp = true
  
  override func terrorizeTown() {
    town?.changePopulation(by: -33)
    super.terrorizeTown()
  }
}
