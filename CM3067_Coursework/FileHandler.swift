//
//  FileHandler.swift
//  CM3067_Coursework2
//
//  Created by ANDREW TAIT (1504693) on 13/12/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class FileHandler{
    
    var arr = NSMutableArray()
    
    
    //Loading plist file
    
    func loadFile()
    {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let docFolder = NSURL(fileURLWithPath: paths[0] as! String)
        let path = docFolder.URLByAppendingPathComponent("PokemonData.plist")
        let fileManager = NSFileManager.defaultManager()
        
        print(path)
        
        var pokemonArray: [pokemon] = []
        
        if(!fileManager.fileExistsAtPath(path.path!)){

            let pokemon1: pokemon = pokemon(name:"pikachu", type: "Electric",  species: "Mouse Pokémon", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90)
            pokemonArray.append(pokemon1)
            
            dump(pokemonArray)
            
            let someData = (pokemonArray as AnyObject as! NSArray).mutableCopy()
            //let someData = NSMutableArray(array: pokemonArray)\
            
           dump(someData)
            let isWritten = someData.writeToFile(path.path!, atomically: true)
            print("is the file created: \(isWritten)")
            
        }else{
            print("file exists")
            arr = NSMutableArray(contentsOfFile: path.path!)!
            for element in arr {
                print(element)
            }
            
        }
        
    }
    
    func setArray(Pokemon: [pokemon]){
        
        arr = (Pokemon as AnyObject as! NSArray).mutableCopy() as! NSMutableArray
        
        for element in arr {
            print(element)
        }
    }
    
    func getArray() -> Array<Any>
    {
        let pokemonArray = arr as NSArray as? [pokemon]
            return pokemonArray!
    }
    
    
    //Saving plist file
    
    func saveFile(){
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let docFolder = paths.objectAtIndex(0) as! NSString
        let path = docFolder.stringByAppendingPathComponent("PokemonData.plist")
         print(arr)
        arr.writeToFile(path, atomically: false)
    }

    
}



