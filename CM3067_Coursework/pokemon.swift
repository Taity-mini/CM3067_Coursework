//
//  pokemon.swift
//  CM3067_Coursework
//
//  Created by Andrew Tait on 09/12/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
// Custom class to define pokemon objects used throughout APP
//

import Foundation

class pokemon: NSObject, NSCoding{
    let name: String
    let type: String
    let species: String
    let hitPoints: Int
    let mainAttack: Int
    let mainDefence: Int
    let spAtk: Int
    let spDef:Int
    let speed:Int
    let releaseDate: String
    

    
    
    init(name: String, type: String, species: String, hitPoints: Int,mainAttack: Int, mainDefence: Int, spAtk: Int, spDef: Int, speed: Int, releaseDate: String){
        self.name = name
        self.type = type
        self.species = species
        self.hitPoints = hitPoints
        self.mainAttack = mainAttack
        self.mainDefence = mainDefence
        self.spAtk = spAtk
        self.spDef = spDef
        self.speed = speed
        self.releaseDate = releaseDate
    }
    
    //override init(){}
    
    //NSCoder stuff for saving/reading to plist file
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(pokemonArray, forKey: "pokemonArray")
        aCoder.encodeObject(name, forKey:"name")
        aCoder.encodeObject(type, forKey:"type")
        aCoder.encodeObject(species, forKey:"species")
        aCoder.encodeObject(hitPoints, forKey:"hitPoints")
        aCoder.encodeObject(mainAttack, forKey:"mainAttack")
        aCoder.encodeObject(mainDefence, forKey:"mainDefence")
        aCoder.encodeObject(spAtk, forKey:"spAtk")
        aCoder.encodeObject(spDef, forKey:"spDef")
        aCoder.encodeObject(speed, forKey:"speed")
        aCoder.encodeObject(releaseDate, forKey:"releaseDate")
    }
    
    
    
    
    
    var pokemonArray = NSMutableArray()
    
    
    
    func add(Pokemon: pokemon) {
        var i = 1
        var found = false
        while i <= self.pokemonArray.count {
            if(self.pokemonArray[i].name == Pokemon.name)
            {
                found = true
            }
            i += 1
        }
        
        if found
        {
            print("Pokemon Found")
        }
        else
        {
            self.pokemonArray.addObject(Pokemon)
        }
    }
    
    
    
    
    func doesPokemonExist(Pokemon: pokemon)  -> Bool {
        var i = 1
        var found = false
        while i <= self.pokemonArray.count {
            if(self.pokemonArray[i].name == Pokemon.name)
            {
                found = true
            }
            i += 1
        }
        
        if found
        {
            return true
        }
        return false
    }
    
    
    func save() {
        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "pokemonList")
    }
    
   class func loadSaved() -> pokemon? {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("pokemonList") as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? pokemon
        }
        return nil
    }
    
    func savePokemon(Pokemon: pokemon) {
        let pokemonList = pokemon.loadSaved()
        pokemonList?.add(Pokemon)
        pokemonList?.save()
    }
    
    
    
    required init?  (coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String!
        self.type = aDecoder.decodeObjectForKey("type") as! String!
        self.pokemonArray = aDecoder.decodeObjectForKey("pokemonArray") as! NSMutableArray
        self.species = aDecoder.decodeObjectForKey("species") as! String!
        self.hitPoints = aDecoder.decodeObjectForKey("hitPoints") as! Int
        self.mainAttack = aDecoder.decodeObjectForKey("mainAttack") as! Int
        self.mainDefence = aDecoder.decodeObjectForKey("mainDefence") as! Int
        self.spAtk = aDecoder.decodeObjectForKey("spAtk") as! Int
        self.spDef = aDecoder.decodeObjectForKey("spDef") as! Int
        self.speed = aDecoder.decodeObjectForKey("speed") as! Int
        self.releaseDate = aDecoder.decodeObjectForKey("releaseDate") as! String!

    }
    
    
    func pokemonSaveExists(kpokemonKey: String) -> Bool {
        return NSUserDefaults.standardUserDefaults().objectForKey(kpokemonKey) != nil
    }
    
}




