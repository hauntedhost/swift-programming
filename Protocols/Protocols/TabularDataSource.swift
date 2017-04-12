//
//  TabularDataSource.swift
//  Protocols
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

protocol TabularDataSource {

  var numberOfRows: Int { get }
  var numberOfColumns: Int { get }

  func label(forColumn column: Int) -> String
  func itemFor(row: Int, column: Int) -> String
}

extension TabularDataSource {

  func leftPad(_ string: String, _ len: Int) -> String {
    let paddingCount = max(0, len - string.characters.count)
    let padding = repeatElement(" ", count: paddingCount).joined(separator: "")
    return "\(string)\(padding)"
  }

  func dividerFor(columnWidths: [Int]) -> String {
    return "+" + columnWidths.map {
      repeatElement("-", count: $0 + 2).joined(separator: "")
    }.joined(separator: "+") + "+"
  }

  func maxColumnWidths() -> [Int] {
    let dataSource = self
    var columnWidths: [Int] = []

    for i in 0..<dataSource.numberOfColumns {
      columnWidths.append(dataSource.label(forColumn: i).characters.count)
    }

    for i in 0..<dataSource.numberOfRows {
      for j in 0..<dataSource.numberOfColumns {
        let maxWidth = columnWidths[j]
        let itemWidth = dataSource.itemFor(row: i, column: j).characters.count
        columnWidths[j] = itemWidth > maxWidth ? itemWidth : maxWidth
      }
    }
    
    return columnWidths
  }

  func printTable() {
    let dataSource = self
    let columnWidths: [Int] = maxColumnWidths()
    let divider = dividerFor(columnWidths: columnWidths)

    print(divider)

    var labelRow = "|"
    for i in 0..<dataSource.numberOfColumns {
      let columnLabel = dataSource.label(forColumn: i)
      labelRow += " \(leftPad(columnLabel, columnWidths[i])) |"
    }
    print(labelRow)

    print(divider)

    for i in 0..<dataSource.numberOfRows {
      var dataRow = "|"
      for j in 0..<dataSource.numberOfColumns {
        let item = dataSource.itemFor(row: i, column: j)
        dataRow += " \(leftPad(item, columnWidths[j])) |"
      }
      print(dataRow)
    }
    
    print(divider)
  }
}
