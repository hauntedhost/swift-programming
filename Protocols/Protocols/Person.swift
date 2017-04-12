//
//  Person.swift
//  Protocols
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct Person {
  let name: String
  let age: Int
  let city: City

  init(name: String, age: Int, city: City) {
    self.name = name
    self.age = age
    self.city = city
  }
}
