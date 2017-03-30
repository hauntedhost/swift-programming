//
//  main.swift
//  MonsterTown
//
//  Created by sean on 3/29/17.
//  Copyright © 2017 MetaTree. All rights reserved.
//

import Foundation

var asheville = Town()
asheville.name = "Asheville"
asheville.printDescription()

asheville.changePopulation(by: -22)
asheville.printDescription()

let vampire = Monster()
vampire.name = "Nosferatu"

vampire.town = asheville
vampire.terrorizeTown()

let zombie = Zombie()
zombie.name = "Fred"

zombie.terrorizeTown()

zombie.town = asheville
zombie.terrorizeTown()
asheville.printDescription()
zombie.town?.printDescription()

