//
//  Asset.swift
//  Arc
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class Asset: Describable {
  let name: String
  let value: Double
  weak var owner: Person?

  var description: String {
    if let owner = owner {
      return "Asset \(name), worth \(value), is owned by \(owner.name)."
    } else {
      return "Asset \(name), worth \(value), is unowned."
    }
  }

  init(name: String, value: Double) {
    self.name = name
    self.value = value
  }

  deinit {
    print("\(self) \"\(name)\" is being deallocated")
  }
}
