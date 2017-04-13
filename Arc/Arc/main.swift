//
//  main.swift
//  Arc
//
//  Created by sean on 4/12/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

func printOptional(_ thing: Any?) {
  if let thing = thing {
    print("Optional(\(thing))")
  } else {
    print("nil")
  }
}

// by default all references that you create are _strong_ references
var bob: Person? = Person(name: "Bob")
printOptional(bob)

var laptop: Asset? = Asset(name: "Macbook Air", value: 1_399.00)
var coffee: Asset? = Asset(name: "Double Espresso", value: 3.99)
var dagger: Asset? = Asset(name: "Medieval Dagger", value: 9_400.00)

bob?.takeOwnership(of: laptop!)
bob?.takeOwnership(of: coffee!)

bob = nil
laptop = nil
coffee = nil
dagger = nil

// NOTE: when Asset.owner property is _not_ weak, only the dagger is deallocated
// bob, laptop and coffee remain in a memory leak:
//
//Arc.Asset "Medieval Dagger" is being deallocated

// when Asset.owner property is var weak everythign is deallocated properly:
//
//Arc.Person "Bob" is being deallocated
//Arc.Asset "Macbook Air" is being deallocated
//Arc.Asset "Double Espresso" is being deallocated
//Arc.Asset "Medieval Dagger" is being deallocated
