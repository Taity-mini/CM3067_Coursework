//
//  ViewController.swift
//  CM3067_Coursework
//
//  Created by Andrew Tait on 30/10/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Field variables
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var pokemonDescription: UITextField!
    @IBOutlet weak var pokemonType: UITextField!
    @IBOutlet weak var pokemonSpecies: UITextField!
    @IBOutlet weak var pokemonHitPoints: UITextField!
    @IBOutlet weak var pokemonMainAttack: UITextField!
    @IBOutlet weak var pokemonMainDefence: UITextField!
    @IBOutlet weak var pokemonReleaseDate: UIDatePicker!
    
    var Pokemon: pokemon = pokemon(name:"", description: "", type:"", species: "", hitPoints: 0.0, mainAttack: 0.0, mainDefence: 0.0)
    
    @IBAction func hideKeyboard(sender: AnyObject){
        resignFirstResponder()
    }
    
    
    //Input Validation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "doneSegue" {
            
            if (name.text!.isEmpty) {
                
                let alert = UIAlertView()
                alert.title = "No Text"
                alert.message = "Please Enter Text In The Box"
                alert.addButtonWithTitle("Ok")
                alert.show()
                
                return false
            }
                
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    
    func newPokemon() -> pokemon {
        
        
        
        let newPokemon: pokemon = pokemon(name:  name.text!, description: pokemonDescription.text!, type: pokemonType.text!, species: pokemonSpecies.text!, hitPoints: (pokemonHitPoints.text! as NSString).doubleValue, mainAttack: (pokemonMainAttack.text! as NSString).doubleValue, mainDefence: (pokemonMainDefence.text! as NSString).doubleValue)
        return newPokemon
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue" {
            Pokemon = newPokemon()
        }
    }
    
}

