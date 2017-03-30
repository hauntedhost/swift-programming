//
//  Zombie.swift
//  MonsterTown
//
//  Created by sean on 3/29/17.
//

import Foundation

class Zombie: Monster {
  var walksWithLimp = true
  private(set) var isFallingApart = false
 
  override var numAttacks: Int {
    didSet {
      if numAttacks >= 3 {
        isFallingApart = true
      }
    }
  }

  override class var spookyNoise: String {
    return "Braaains!"
  }
  
  override func terrorizeTown() {
    if !isFallingApart {
      super.terrorizeTown()
    } else {
      print("The \(name) monster tried to attack but has fallen the hell apart")
    }
  }
}
