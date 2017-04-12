//
//  main.swift
//  ErrorHandling
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

func evaluate(_ input: String) {
  print("evaluating: \(input)")
  let lexer = Lexer(input: input)

  do {
    let tokens = try lexer.lex()
    print("lexer tokens: \(tokens)")

    let parser = Parser(tokens: tokens)
    let result = try parser.parse()
    print("parser result: \(result)")
  } catch Lexer.Error.invalidCharacter(let character) {
    print("[Error] Invalid character: \(character)")
  } catch Parser.Error.invalidToken(let token) {
    print("[Error] Invalid token while parsing: \(token)")
  } catch Parser.Error.unexpectedEndOfInput {
    print("[Error] Unexpected end of input while parsing")
  } catch let error {
    print("[Error] Unknown error: \(error)")
  }
}

evaluate("10 + 3 +  5")
evaluate("9 + 2 + abc")
evaluate("3 + 3 9")
