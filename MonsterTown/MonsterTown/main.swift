//
//  main.swift
//  MonsterTown
//
//  Created by sean on 3/29/17.
//

import Foundation

var quimby = Mayor()
quimby.name = "Quimby"

var asheville: Town?

asheville = Town(
  region: "Southeast",
  name: "Springfield",
  population: 0,
  mayor: quimby,
  stoplights: 18
)

asheville = Town(
  region: "Southeast",
  name: "Springfield",
  population: 87_236,
  mayor: quimby,
  stoplights: 18
)

if var asheville = asheville {
  asheville.printDescription()

  asheville.changePopulation(by: 5_000)
  asheville.printDescription()

  let vampire = Monster(name: "Nosferatu", town: asheville)
  vampire.makeSpookyNoise()
  vampire.terrorizeTown()

  vampire.victimPool = 500
  vampire.town?.printDescription()

  var zombie: Zombie? = Zombie(name: "Fred", town: asheville)

  if let zombie = zombie {
    zombie.makeSpookyNoise()

    zombie.terrorizeTown()
    zombie.terrorizeTown()
    zombie.town?.printDescription()

    zombie.terrorizeTown()
    zombie.town?.printDescription()

    zombie.terrorizeTown()
    zombie.town?.printDescription()

    zombie.terrorizeTown()
    zombie.town?.printDescription()
  }

  zombie = nil
}
