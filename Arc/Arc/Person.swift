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

  var description: String {
    return "Person(\(name))"
  }

  init(name: String) {
    self.name = name
  }

  func takeOwnership(of asset: Asset) {
    asset.owner = self
    assets.append(asset)
  }

  deinit {
    print("\(self) \"\(name)\" is being deallocated")
  }
}
