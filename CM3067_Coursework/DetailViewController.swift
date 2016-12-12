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
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var hitPoints: UILabel!
    @IBOutlet weak var mainAttack: UILabel!
    @IBOutlet weak var mainDefence: UILabel!
    @IBOutlet weak var pokemonEntry: UIWebView!
    
    
    var ChosenPokemon: pokemon = pokemon(name:"", description: "", type:"", species: "", hitPoints: 0.0, mainAttack: 0.0, mainDefence: 0.0)
    
    
    func getPokemon(){
        //Display all pokemon attributes
        name.text = ChosenPokemon.name
        pokemonDescription.text = ChosenPokemon.description
        pokemonType.text = ChosenPokemon.type
        species.text = ChosenPokemon.species
        mainAttack.text = ChosenPokemon.mainAttack.description
        mainDefence.text = ChosenPokemon.mainDefence.description
        hitPoints.text = ChosenPokemon.hitPoints.description
        
        let theURL = "https://dex.pokemonshowdown.com/pokemon/" + ChosenPokemon.name
        
        
        let flagWebURL: NSURL = NSURL(string: theURL)!
        pokemonEntry.loadRequest(NSURLRequest(URL: flagWebURL))
        
    
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
