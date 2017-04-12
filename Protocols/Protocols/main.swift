//
//  main.swift
//  Protocols
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

extension Array {
  subscript (safe index: Index) -> Element? {
    return index < count ? self[index] : nil
  }
}

func leftPad(_ string: String, _ len: Int) -> String {
  let paddingCount = max(0, len - string.characters.count)
  let padding = repeatElement(" ", count: paddingCount).joined(separator: "")
  return "\(string)\(padding)"
}

func maxColumnWidths(_ rows: [[String]]) -> [Int] {
  var columnWidths: [Int] = []
  for row in rows {
    for (i, item) in row.enumerated() {
      let itemWidth = item.characters.count
      if let currentWidth = columnWidths[safe: i] {
        columnWidths[i] = itemWidth > currentWidth ? itemWidth : currentWidth
      } else {
        columnWidths.append(itemWidth)
      }
    }
  }
  return columnWidths
}

func dividerFor(columnWidths: [Int]) -> String {
  return "+" + columnWidths.map {
    repeatElement("-", count: $0 + 2).joined(separator: "")
  }.joined(separator: "+") + "+"
}

func printTable(_ rows: [[String]], columnLabels: String...) {

  let columnWidths: [Int] = maxColumnWidths(rows + [columnLabels])
  let divider = dividerFor(columnWidths: columnWidths)

  print(divider)

  var labelRow = "|"
  for (i, columnLabel) in columnLabels.enumerated() {
    labelRow += " \(leftPad(columnLabel, columnWidths[i])) |"
  }
  print(labelRow)

  print(divider)

  for row in rows {
    var dataRow = "|"
    for (i, item) in row.enumerated() {
      dataRow += " \(leftPad(item, columnWidths[i])) |"
    }
    print(dataRow)
  }

  print(divider)
}

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

printTable(rows, columnLabels: "Name", "Age", "City")
printTable(rowsWithState, columnLabels: "Name", "Age", "City", "State")
