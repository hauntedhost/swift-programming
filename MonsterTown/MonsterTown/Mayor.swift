//
//  Mayor.swif.swift
//  MonsterTown
//
//  Created by sean on 3/30/17.
//

import Foundation

class Mayor {
  var name = "Mr. Mayor"
  private var anxietyLevel = 0
  
  func notifyOfLoss(to town: Town?) {
    if let town = town {
      print([
        "I'm deeply saddened to hear of the recent loss of population",
        "in our good town of \(town.name)",
      ].joined(separator: " "))
    }
  }
}
