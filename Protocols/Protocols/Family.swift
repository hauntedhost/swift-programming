//
//  City.swift
//  Protocols
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

typealias FamilyMembers = [Person]

struct Family {
  let surname: String
  var members: FamilyMembers = []

  init(surname: String) {
    self.surname = surname
  }

  init(surname: String, members: FamilyMembers) {
    self.surname = surname
    self.members = members
  }
}

extension Family: TabularDataSource {
  var numberOfRows: Int {
    return members.count
  }

  var numberOfColumns: Int {
    return 3
  }

  func label(forColumn column: Int) -> String {
    switch column {
      case 0: return "Name"
      case 1: return "Age"
      case 2: return "City"
      default: fatalError("Invalid column")
    }
  }

  func itemFor(row: Int, column: Int) -> String {
    let member = members[row]
    switch column {
      case 0: return member.name
      case 1: return String(member.age)
      case 2: return member.city.name
      default: fatalError("Invalid column")
    }
  }
}
