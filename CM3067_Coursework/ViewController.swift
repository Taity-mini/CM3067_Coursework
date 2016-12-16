//
//  ViewController.swift
//  CM3067_Coursework
//
//  Created by Andrew Tait on 30/10/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //Field variables
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var pokemonSpecies: UITextField!
    @IBOutlet weak var pokemonHitPoints: UITextField!
    @IBOutlet weak var pokemonMainAttack: UITextField!
    @IBOutlet weak var pokemonMainDefence: UITextField!
    @IBOutlet weak var pokemonSPAtk: UITextField!
    @IBOutlet weak var pokemonSPDef: UITextField!
    @IBOutlet weak var pokemonSpeed: UITextField!
    @IBOutlet weak var pokemonReleaseDate: UIDatePicker!
    
    
    var pickerData: [String] = [String]()
    
    var Pokemon: pokemon = pokemon(name:"", type:"", species: "", hitPoints: 0, mainAttack: 0, mainDefence: 0, spAtk:0, spDef: 0, speed: 0, releaseDate: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Input validation handlers
        pokemonReleaseDate.datePickerMode = UIDatePickerMode.Date
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.name.addTarget(self, action: #selector(ViewController.inputValdiation(_:)), forControlEvents: UIControlEvents.EditingChanged)
        self.pokemonSpecies.addTarget(self, action: #selector(ViewController.inputValdiation(_:)), forControlEvents: UIControlEvents.EditingChanged)
        self.pokemonMainAttack.addTarget(self, action: #selector(ViewController.inputValdiationInt(_:)), forControlEvents: UIControlEvents.EditingChanged)
        self.pokemonSPAtk.addTarget(self, action: #selector(ViewController.inputValdiationInt(_:)), forControlEvents: UIControlEvents.EditingChanged)
        self.pokemonSPDef.addTarget(self, action: #selector(ViewController.inputValdiationInt(_:)), forControlEvents: UIControlEvents.EditingChanged)
        self.pokemonSpeed.addTarget(self, action: #selector(ViewController.inputValdiationInt(_:)), forControlEvents: UIControlEvents.EditingChanged)
        self.pokemonHitPoints.addTarget(self, action: #selector(ViewController.inputValdiationInt(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        
        //Pokemon Types
        //    NORMAL	FIRE	WATER	ELECTRIC	GRASS	ICE FIGHTING	POISON	GROUND	FLYING	PSYCHIC	BUG ROCK	GHOST	DRAGON	DARK	STEEL	FAIRY
        pickerData = ["Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy"]
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //Input valdiation for strings
    func inputValdiation(sender: UITextField) {
        
        if sender.text!.isEmpty {
            let alert = UIAlertController(title: "No Text", message:"Please enter data", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
            self.presentViewController(alert, animated: true){}
            
        } else {
            // text field is not empty
        }
    }
    
    //Input Validation for Integers
    
    func inputValdiationInt(sender: UITextField) {
        
        if sender.text!.isEmpty {
            let alert = UIAlertController(title: "No Text", message:"Please enter data", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
            self.presentViewController(alert, animated: true){}
            
        } else {
            // text field is not empty
        }
    }
    
    
    
  
    
    @IBAction func hideKeyboard(sender: AnyObject){
        resignFirstResponder()
    }
    
    
    //Input Validation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "doneSegue" {
            
            
            if (name.text!.isEmpty || pokemonSpecies.text!.isEmpty || pokemonHitPoints.text!.isEmpty || pokemonMainAttack.text!.isEmpty || pokemonMainDefence.text!.isEmpty) {
                
                let alert = UIAlertController(title: "No Text", message:"Please Enter all fields", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
                self.presentViewController(alert, animated: true){}
                
                return false
            }
                
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    //Create new pokemon object based on text fields
    func newPokemon() -> pokemon {
        
        let selectedValue = pickerData[pickerView.selectedRowInComponent(0)]
        
        //Convert date date picker to string using date formatter
        let dateFormatter = NSDateFormatter()
        // Now we specify the display format, e.g. "27-08-2015
        dateFormatter.dateFormat = "dd-MM-YYYY"
        // Now we get the date from the UIDatePicker and convert it to a string
        let strDate = dateFormatter.stringFromDate(pokemonReleaseDate.date)
        
        
        let newPokemon = pokemon(name: name.text!, type: selectedValue, species: pokemonSpecies.text!, hitPoints: Int (pokemonHitPoints.text!)!, mainAttack: Int(pokemonMainAttack.text!)!, mainDefence: Int(pokemonMainDefence.text!)!, spAtk: Int(pokemonSPAtk.text!)!, spDef: Int(pokemonSPDef.text!)!, speed: Int(pokemonSpeed.text!)! ,releaseDate: strDate)
        
        return newPokemon
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Date picker properties
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue" {
            Pokemon = newPokemon()
        }
    }
    
}

