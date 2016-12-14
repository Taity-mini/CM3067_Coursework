//
//  DetailViewController.swift
//  CM3067_Coursework
//
//  Created by Andrew Tait on 10/12/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var hitPoints: UILabel!
    @IBOutlet weak var mainAttack: UILabel!
    @IBOutlet weak var mainDefence: UILabel!
    @IBOutlet weak var pokemonEntry: UIWebView!
    @IBOutlet weak var pokemonSPAtk: UILabel!
    @IBOutlet weak var pokemonSPDef: UILabel!
    @IBOutlet weak var pokemonSpeed: UILabel!
    var ChosenPokemon: pokemon = pokemon(name:"", type:"", species: "", hitPoints: 0, mainAttack: 0, mainDefence: 0, spAtk:0, spDef: 0, speed: 0, releaseDate: "")
    
    @IBOutlet weak var dateDifference: UILabel!
    @IBOutlet weak var total: UILabel!
    
    func getPokemon(){
        //Display all pokemon attributes
        name.text = ChosenPokemon.name
        
        pokemonType.text = ChosenPokemon.type
        species.text = ChosenPokemon.species
        mainAttack.text = ChosenPokemon.mainAttack.description
        mainDefence.text = ChosenPokemon.mainDefence.description
        hitPoints.text = ChosenPokemon.hitPoints.description
        pokemonSPAtk.text = ChosenPokemon.spAtk.description
        pokemonSPDef.text = ChosenPokemon.spDef.description
        pokemonSpeed.text = ChosenPokemon.speed.description
        
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        let chosenDate = dateFormatter.dateFromString(ChosenPokemon.releaseDate)
        
        let todaysDate: NSDate = NSDate()

        
        let difference = daysBetweenDates(todaysDate, endDate: chosenDate!)
        dateDifference.text = difference.description
        let totalStats = ChosenPokemon.mainAttack + ChosenPokemon.mainDefence + ChosenPokemon.hitPoints + ChosenPokemon.hitPoints + ChosenPokemon.spAtk; +ChosenPokemon.spDef + ChosenPokemon.speed
        
        total.text = totalStats.description
        
        let theURL = "https://dex.pokemonshowdown.com/pokemon/" + ChosenPokemon.name.lowercaseString
        
        
        let pokedexURL: NSURL = NSURL(string: theURL)!
        pokemonEntry.loadRequest(NSURLRequest(URL: pokedexURL))
        
    }
    
    func daysBetweenDates(startDate: NSDate, endDate: NSDate) -> Int
    {
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Day], fromDate: startDate, toDate: endDate, options: [])
        
        return components.day
    }
    

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPokemon()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
