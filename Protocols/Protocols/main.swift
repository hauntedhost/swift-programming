//
//  main.swift
//  Protocols
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

func printTable(_ data: [[String]]) {
  for row in data {
    var out = "|"
    for item in row {
      out += " \(item) |"
    }
    print(out)
  }
}

let data = [
  ["Sean", "373", "422"],
  ["Castle", "42", "72"],
  ["Alli", "923", "989"],
]

printTable(data)
