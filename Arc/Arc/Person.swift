//
//  Person.swift
//  Arc
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class Person: Describable {
  let name: String
  var assets: [Asset] = []
  var accountant: Accountant = Accountant()

  var description: String {
    return "Person(\(name))"
  }

  init(name: String) {
    self.name = name
    accountant.netWorthChangeHandler = { [weak self] netWorth in
      self?.netWorthDidChange(to: netWorth)
    }
  }

  func takeOwnership(of asset: Asset) {
    asset.owner = self
    assets.append(asset)
    accountant.gained(asset)
  }

  func netWorthDidChange(to netWorth: Double) {
    print("The net worth of \(self.name) is now \(netWorth)")
  }

  deinit {
    print("\(self) \"\(name)\" is being deallocated")
  }
}
