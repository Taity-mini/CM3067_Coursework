//
//  pokemon.swift
//  CM3067_Coursework
//
//  Created by Andrew Tait on 09/12/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
// Custom class to define pokemon objects used throughout APP
//

import Foundation

class pokemon{
    let name: String
    let description: String
    let type: String
    let species: String
    let hitPoints: Double
    let mainAttack: Double
    let mainDefence: Double
    //let releaseDate: NSDate
    
    init(name: String,description: String, type: String, species: String, hitPoints: Double,mainAttack: Double, mainDefence: Double){
        self.name = name
        self.description = description
        self.type = type
        self.species = species
        self.hitPoints = hitPoints
        self.mainAttack = mainAttack
        self.mainDefence = mainDefence
        //self.releaseDate = releaseDate
    }
    
    
    
}