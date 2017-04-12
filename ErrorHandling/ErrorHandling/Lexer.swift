//
//  Lexer.swift
//  ErrorHandling
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class Lexer {
  enum Error: Swift.Error {
    case invalidCharacter(Character)
  }

  let input: String.CharacterView
  var position: String.CharacterView.Index

  init(input: String) {
    self.input = input.characters
    self.position = self.input.startIndex
  }

  func peek() -> Character? {
    guard position < input.endIndex else {
      return nil
    }
    return input[position]
  }

  func advance() {
    assert(position < input.endIndex, "Cannot advance past endIndex!")
    position = input.index(after: position)
  }

  func lex() throws -> [Token] {
    var tokens: [Token] = []
    while let nextCharacter = peek() {
      switch nextCharacter {
      case "0"..."9":
        let value = getNumber()
        tokens.append(.number(value))
      case "+":
        tokens.append(.plus)
        advance()
      case " ":
        advance()
      default:
        throw Lexer.Error.invalidCharacter(nextCharacter)
      }
    }
    return tokens
  }

  func getNumber() -> Int {
    var value = 0
    while let nextCharacter = peek() {
      switch nextCharacter {
      case "0"..."9":
        let digitValue = Int(String(nextCharacter))!
        value = 10 * value + digitValue
        advance()
      default:
        return value
      }
    }
    return value
  }
}
