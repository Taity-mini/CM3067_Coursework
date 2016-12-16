//
//  PokemonTableViewController.swift
//  CM3067_Coursework
//
//  Created by Andrew Tait on 10/12/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PokemonTableViewController: UITableViewController {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    

    var pokemonArray: [pokemon] = []
    
    //Table view arrays
    var released: [pokemon] = []
    var captured: [pokemon] = []
    
    //Empty pokemon object to pass between views
    var Pokemon: pokemon = pokemon(name:"", type:"", species: "", hitPoints: 0, mainAttack: 0, mainDefence: 0, spAtk:0, spDef: 0, speed: 0, releaseDate: "")

    
    var counter: Int = 0
    func findReleasedPokemon()
    {
        released = []
        captured = []
        
        counter = 0
        
        for pokemon in pokemonArray{
            
            //Ref date
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-mm-yyyy"
            let releaseDate = dateFormatter.dateFromString(pokemon.releaseDate)
            
            // Get current date
            let dateA = NSDate()
            
            // Get a later date (after a couple of milliseconds)
            
            
            // Compare them
            switch releaseDate!.compare(dateA) {
            case .OrderedAscending     :
                //Put into released array
                released.append(pokemon)
            //print("Date A is earlier than date B")
            case .OrderedDescending    :
                captured.append(pokemon)
            //print("Date A is later than date B")
            case .OrderedSame          :   print("The two dates are the same")
            captured.append(pokemon)
            }
            
            counter+=1
        }
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initalPokemon()
        insertItems()
        retrieveItems()
        findReleasedPokemon()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
    }
    
    //Insert pokemon objects into user defaults
    func insertItems()
    {
        userDefaults.removeObjectForKey("pokemon")
        let data = NSKeyedArchiver.archivedDataWithRootObject(pokemonArray)
        userDefaults.setObject(data, forKey: "pokemon")
        userDefaults.synchronize()
    }
    
    
    //Get pokemon objects from user defaults
    func retrieveItems()
    {
        //Check if keyvalue exists
        if (Pokemon.pokemonSaveExists("pokemon")){
            
            //userDefaults.synchronize()
            if let data = userDefaults.objectForKey("pokemon") as? NSData {
                dump(data)
                pokemonArray = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [pokemon]
                dump(pokemonArray)
                print("Read Successfull")
            }
            else{
                print ("Read failed")
            }
            
        } else{ //Otherwise load inital pokemon data
            initalPokemon()
        }
    }
    
    func initalPokemon()
    {
        //Inital pokemon if userdefaults is empty
        
        //Captured Pokemon
        //Inspired by twitch plays pokemon red
        //en.wikipedia.org/wiki/Twitch_Plays_Pokémon
        let pokemon1: pokemon = pokemon(name:"Pikachu", type: "Electric",  species: "Mouse Pokémon", hitPoints: 35, mainAttack: 55, mainDefence: 40, spAtk: 50, spDef: 50, speed: 90, releaseDate: "21-12-2017")
        let pokemon2: pokemon = pokemon(name:"Pidgeot", type: "Flying",  species: "Bird Jesus", hitPoints: 83, mainAttack: 80, mainDefence: 75, spAtk: 70, spDef: 70, speed: 101, releaseDate: "21-12-2017")
        let pokemon3: pokemon = pokemon(name:"Omanyte", type: "Water",  species: "Lord Helix", hitPoints: 35, mainAttack: 40, mainDefence: 100, spAtk: 90, spDef: 55, speed: 35, releaseDate: "14-12-2017")
        let pokemon4: pokemon = pokemon(name:"Zapdos", type: "Electric",  species: "Battery Jesus", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90, releaseDate: "14-12-2017")
        let pokemon5: pokemon = pokemon(name:"Nidoking", type: "Posion",  species: "The Fonz", hitPoints: 81, mainAttack: 102, mainDefence: 77, spAtk: 85, spDef: 75, speed: 85, releaseDate: "14-12-2017")
        let pokemon6: pokemon = pokemon(name:"Lapras", type: "Ice",  species: "Air Jordon", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90, releaseDate: "14-12-2017")
        let pokemon7: pokemon = pokemon(name:"Venomoth", type: "Bug",  species: "All Terrain Venomoth", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90, releaseDate: "14-12-2017")
        
        //Released Pokemon
         let pokemon8: pokemon = pokemon(name:"Rattata", type: "Normal",  species: "Mouse Pokémon", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90, releaseDate: "14-12-2015")
         let pokemon9: pokemon = pokemon(name:"Magikarp", type: "Water",  species: "Fish Pokémon", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90, releaseDate: "14-12-2014")
         let pokemon10: pokemon = pokemon(name:"Weedle", type: "Bug",  species: "Hairy Bug Pokémon", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90, releaseDate: "14-12-2013")

        
        //Add pokemon to array
         pokemonArray.append(pokemon3)
         pokemonArray.append(pokemon2)
         pokemonArray.append(pokemon4)
         pokemonArray.append(pokemon5)
         pokemonArray.append(pokemon6)
         pokemonArray.append(pokemon7)
         pokemonArray.append(pokemon1)
         pokemonArray.append(pokemon8)
         pokemonArray.append(pokemon9)
         pokemonArray.append(pokemon10)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rowcount = 0
        if(section == 0)
        {
            rowcount =  captured.count
        }
        if(section == 1)
        {
            rowcount = released.count
        }
        
        return rowcount
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("pokemon", forIndexPath: indexPath)
        
        if(indexPath.section == 0)
        {
            
            cell.textLabel!.text = captured[indexPath.row].name as String!?
            
            cell.detailTextLabel!.text = captured[indexPath.row].type as String!
            
            let theURL = "https://img.pokemondb.net/artwork/" + captured[indexPath.row].name.lowercaseString + ".jpg"
            
            cell.imageView!.image = NSURL(string:theURL)
                .flatMap { NSData(contentsOfURL: $0) }
                .flatMap { UIImage(data: $0) }
            
            
        }
        if(indexPath.section == 1)
        {
            cell.textLabel!.text = released[indexPath.row].name as String!?
            
            cell.detailTextLabel!.text = released[indexPath.row].type as String!
            
            let theURL = "https://img.pokemondb.net/artwork/" + released[indexPath.row].name.lowercaseString + ".jpg"
            
            cell.imageView!.image = NSURL(string:theURL)
                .flatMap { NSData(contentsOfURL: $0) }
                .flatMap { UIImage(data: $0) }
            
        }
        
        return cell
    }
    
    //Header sections
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        var header = ""
        switch(section){
        case 0:
            header = "Captured"
            break
        case 1:
            header = "Released"
            break
        default:
            return "unknown"
        }
        
        return header
    }
    
    //Change background colour based on pokemon type
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //    NORMAL	FIRE	WATER	ELECTRIC	GRASS	ICE FIGHTING	POISON	GROUND	FLYING	PSYCHIC	BUG ROCK	GHOST	DRAGON	DARK	STEEL	FAIRY
        //Change cell background based on pokemon type:
        
        var type: String = ""
        
        if(indexPath.section == 0){
            type =  captured[indexPath.row].type
        }
        
        if(indexPath.section == 1){
            type =  released[indexPath.row].type
        }
        
        switch(type)
        {
        case "Electric":
            cell.backgroundColor = UIColor.yellowColor()
            break
        case "Water":
            cell.backgroundColor = UIColor.blueColor()
            break
            
        case "Fire":
            cell.backgroundColor = UIColor.redColor()
            break
            
        case "Grass":
            cell.backgroundColor = UIColor.greenColor()
            break
            
        case "Ice":
            cell.backgroundColor = UIColor(red:0.55, green:0.83, blue:0.83, alpha:1.0)
            break
            
        case "Fighting":
            cell.backgroundColor = UIColor(red:0.74, green:0.30, blue:0.27, alpha:1.0)
            break
            
        case "Posion":
            cell.backgroundColor = UIColor.purpleColor()
            break
            
        case "Flying":
            cell.backgroundColor = UIColor(red:0.85, green:0.73, blue:0.38, alpha:1.0)
            break
            
            
        case "Psychic":
            cell.backgroundColor = UIColor(red:0.91, green:0.53, blue:0.46, alpha:1.0)
            break
            
        case "Bug":
            cell.backgroundColor = UIColor(red:0.67, green:0.72, blue:0.25, alpha:1.0)
            break
            
        case "Rock":
            cell.backgroundColor = UIColor(red:0.67, green:0.72, blue:0.25, alpha:1.0)
            break
            
            
        case "Ghost":
            cell.backgroundColor = UIColor(red:0.49, green:0.42, blue:0.62, alpha:1.0)
            break
            
        case "Dark":
            cell.backgroundColor = UIColor(red:0.48, green:0.41, blue:0.36, alpha:1.0)
            break
            
        case "Dragon":
            cell.backgroundColor = UIColor(red:0.44, green:0.27, blue:0.84, alpha:1.0)
            break
            
        case "Steel":
            cell.backgroundColor = UIColor(red:0.70, green:0.70, blue:0.80, alpha:1.0)
            break
            
        case "Fairy":
            cell.backgroundColor = UIColor(red:0.91, green:0.60, blue:0.91, alpha:1.0)
            break
            
        default:
            cell.backgroundColor = UIColor.clearColor()
        }
        
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if(indexPath.section == 0)
            {
                let delete: pokemon = captured[indexPath.row]
                
                let index = findIndex(delete)
                
                
                pokemonArray.removeAtIndex(index)
                // Delete the row from the data source
                
                findReleasedPokemon()
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                insertItems()
                
            }
            
            if(indexPath.section == 1)
            {
                let delete: pokemon = released[indexPath.row]
                
                let index = findIndex(delete)
                
                
                pokemonArray.removeAtIndex(index)
                // Delete the row from the data source
                
                findReleasedPokemon()
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                insertItems()
            }
            
        
        }
    }
    
    //Find find of orginal pokemon array using selected pokemon object
    func findIndex(Pokemon: pokemon)-> Int{
        
        let find: pokemon = Pokemon
        
        var index: Int = 0
        var counter: Int = 0
        for pokemon in pokemonArray{
            dump(pokemon.name)
            if(pokemon == find)
            {
                print("Found it!")
                index = counter
                dump(counter)
            }
            counter+=1
        }
        
        return index
        
    }
    
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        
        var fromindex: Int = 0;
        var toindex: Int = 0
        if(fromIndexPath.section != toIndexPath.section)
        {
            let alert = UIAlertController(title: "Error", message:"You can't move between sections", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
            self.presentViewController(alert, animated: true){}
            tableView.reloadData()
            
        } else{
            if(fromIndexPath.section==0){
                fromindex = findIndex(captured[fromIndexPath.row])
                toindex = findIndex(captured[toIndexPath.row])
            }
            if(fromIndexPath.section==1){
                fromindex  = findIndex(released[fromIndexPath.row])
                toindex  = findIndex(released[toIndexPath.row])
            }
            
            let itemToMove = pokemonArray[fromindex]
            pokemonArray.removeAtIndex(fromindex)
            pokemonArray.insert(itemToMove, atIndex: toindex)
            findReleasedPokemon()
            insertItems()
            tableView.reloadData()
        }
    }
    
    
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.section == 0)
        {
            Pokemon = captured[indexPath.row]
        }
        
        if(indexPath.section == 1)
        {
            Pokemon = released[indexPath.row]
        }
        
        //Pokemon = pokemonArray[indexPath.row]
        performSegueWithIdentifier("detailView", sender: self)
        
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue){
        
    }
    
    
    
    @IBAction func done(segue: UIStoryboardSegue){
        
        let editor = segue.sourceViewController as! ViewController
        let newPokemon = editor.Pokemon
        pokemonArray.append(newPokemon)
        insertItems()
        findReleasedPokemon()
        self.tableView.reloadData()
    }
    

    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detailView"){
            let dvc = segue.destinationViewController as! DetailViewController
            dvc.ChosenPokemon=Pokemon
        }
    }
    
    
}
