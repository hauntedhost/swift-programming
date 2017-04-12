//
//  Parser.swift
//  ErrorHandling
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class Parser {

  enum Error: Swift.Error {
    case unexpectedEndOfInput
    case invalidToken(Token)
  }

  let tokens: [Token]
  var position: Int = 0

  init(tokens: [Token]) {
    self.tokens = tokens
  }

  func getNextToken() -> Token? {
    guard position < tokens.count else {
      return nil
    }

    let token = tokens[position]
    position += 1
    return token
  }

  func getNextNumber() throws -> Int {
    guard let token = getNextToken() else {
      throw Parser.Error.unexpectedEndOfInput
    }

    switch token {
      case .number(let value):
        return value
      case .plus:
        throw Parser.Error.invalidToken(token)
    }
  }

  func parse() throws -> Int {
    var value = try getNextNumber()
    while let token = getNextToken() {
      switch token {
        case .plus:
          let nextNumber = try getNextNumber()
          value += nextNumber
        case .number:
          throw Parser.Error.invalidToken(token)
      }
    }
    return value
  }
}
