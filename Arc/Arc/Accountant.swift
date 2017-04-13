//
//  Accountant.swift
//  Arc
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class Accountant {
  typealias NetWorthChanged = (Double) -> Void

  var netWorthChangeHandler: NetWorthChanged? = nil
  var netWorth: Double = 0.0 {
    didSet {
      netWorthChangeHandler?(netWorth)
    }
  }

  func gained(_ asset: Asset) {
    netWorth += asset.value
  }
}
