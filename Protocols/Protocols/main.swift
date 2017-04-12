//
//  main.swift
//  Protocols
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

// table printer using structs for data, and protocols + extensions for printer

let omlors = Family(
  surname: "Omlor",
  members: [
    Person(name: "Alli", age: 26, city: City(name: "Meridian", state: "MS")),
    Person(name: "Sean", age: 41, city: City(name: "Philadelphia", state: "PA")),
    Person(name: "Sebastian", age: 13, city: City(name: "Oakland", state: "CA")),
    Person(name: "Castle", age: 1, city: City(name: "Rutherfordton", state: "NC")),
  ]
)

omlors.printTable()

// table printer using nested arrays for data and static functions for printer

let rows = [
  ["Alli", "26", "Meridian"],
  ["Castle", "1", "Rutherfordton"],
  ["Sean", "41", "Philadelphia"],
  ["Sebastian", "13", "Oakland"],
]

let rowsWithState = [
  ["Alli", "26", "Meridian", "MS"],
  ["Castle", "1", "Rutherfordton", "NC"],
  ["Sean", "41", "Philadelphia", "PA"],
  ["Sebastian", "13", "Oakland", "CA"],
]

Printer.printTable(rows, columnLabels: "Name", "Age", "City")
Printer.printTable(rowsWithState, columnLabels: "Name", "Age", "City", "State")
