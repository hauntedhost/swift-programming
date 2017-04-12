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
  region: "Southeast",
  name: "Springfield",
  population: 87_236,
  mayor: quimby,
  stoplights: 18
)

asheville.printDescription()

asheville.changePopulation(by: 5_000)
asheville.printDescription()

let vampire = Monster(name: "Nosferatu", town: asheville)
vampire.makeSpookyNoise()
vampire.terrorizeTown()

vampire.victimPool = 500
vampire.town?.printDescription()

let zombie = Zombie(name: "Fred", town: asheville, walksWithLimp: true)
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
