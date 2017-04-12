//
//  main.swift
//  MonsterTown
//
//  Created by sean on 3/29/17.
//

import Foundation

var quimby = Mayor()
quimby.name = "Quimby"

var asheville = Town(
  name: "Springfield",
  numberOfStopLights: 18,
  mayor: quimby,
  population: 87_236
)

asheville.printDescription()

asheville.changePopulation(by: 5_000)
asheville.printDescription()

let vampire = Monster()
vampire.name = "Nosferatu"
vampire.makeSpookyNoise()

vampire.town = asheville
vampire.terrorizeTown()

vampire.victimPool = 500
vampire.town?.printDescription()

let zombie = Zombie()
zombie.name = "Fred"
zombie.makeSpookyNoise()

zombie.terrorizeTown()

// interesting: zombie.terrorizeTown does not mutate asheville.population
// even after passing it as a reference
// aha reason! town is a struct dawg

zombie.town = asheville
//zombie.move(to: &asheville)

zombie.terrorizeTown()
//asheville.printDescription()
zombie.town?.printDescription()

zombie.terrorizeTown()
zombie.town?.printDescription()

zombie.terrorizeTown()
zombie.town?.printDescription()

zombie.terrorizeTown()
zombie.town?.printDescription()


