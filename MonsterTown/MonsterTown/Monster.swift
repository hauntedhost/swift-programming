//
//  Monster.swift
//  MonsterTown
//
//  Created by sean on 3/30/17.
//  Copyright © 2017 MetaTree. All rights reserved.
//

import Foundation

class Monster {
  var town: Town?
  var name = "Monster"
  
  func terrorizeTown() {
    if let town = town {
      print("The \(name) monster is terrorizing the town of \(town.name)")
    } else {
      print("The \(name) monster hasn't found a town to terrorize yet")
    }
  }

  func move(to newTown: inout Town) {
    town = newTown
  }
}
