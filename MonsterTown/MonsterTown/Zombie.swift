//
//  Zombie.swift
//  MonsterTown
//
//  Created by sean on 3/29/17.
//

import Foundation

class Zombie: Monster {
  let walksWithLimp: Bool
  private(set) var isFallingApart: Bool
 
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

  required init(name: String, town: Town?) {
    self.walksWithLimp = true
    self.isFallingApart = false
    super.init(name: name, town: town)
  }

  init(name: String, town: Town?, walksWithLimp: Bool, isFallingApart: Bool) {
    self.walksWithLimp = walksWithLimp
    self.isFallingApart = isFallingApart
    super.init(name: name, town: town)
  }

  convenience init(name: String) {
    self.init(
      name: name,
      town: nil,
      walksWithLimp: true,
      isFallingApart: false
    )
  }

  deinit {
    print("\(name) zombie is no longer with us")
  }

  override func terrorizeTown() {
    if !isFallingApart {
      super.terrorizeTown()
    } else {
      print("The \(name) monster tried to attack but has fallen the hell apart")
    }
  }
}
