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
    
    
    var Pokemon: pokemon = pokemon(name:"", type:"", species: "", hitPoints: 0, mainAttack: 0, mainDefence: 0, spAtk:0, spDef: 0, speed: 0, releaseDate: "")
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //initalPokemon()
        //insertItems()
        retrieveItems()
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
    }
    
    func insertItems()
    {
        //userDefaults.removeObjectForKey("pokemon")
        //userDefaults.synchronize()
        let data = NSKeyedArchiver.archivedDataWithRootObject(pokemonArray)
        userDefaults.setObject(data, forKey: "pokemon")
        ///userDefaults.setObject(data, forKey: "pokemon")
        userDefaults.synchronize()
    }
    
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
        let pokemon1: pokemon = pokemon(name:"pikachu", type: "Electric",  species: "Mouse Pokémon", hitPoints: 20, mainAttack: 40, mainDefence: 30, spAtk: 40, spDef: 50, speed: 90, releaseDate: "14-12-2017")
        pokemonArray.append(pokemon1)
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
        return pokemonArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("pokemon", forIndexPath: indexPath)
        
        
        
        cell.textLabel!.text = pokemonArray[indexPath.row].name as String!?
        
        cell.detailTextLabel!.text = pokemonArray[indexPath.row].type as String!
        
        let theURL = "https://img.pokemondb.net/artwork/" + pokemonArray[indexPath.row].name.lowercaseString + ".jpg"
        
        cell.imageView!.image = NSURL(string:theURL)
            .flatMap { NSData(contentsOfURL: $0) }
            .flatMap { UIImage(data: $0) }
        
        return cell
    }
    
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
    
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //    NORMAL	FIRE	WATER	ELECTRIC	GRASS	ICE FIGHTING	POISON	GROUND	FLYING	PSYCHIC	BUG ROCK	GHOST	DRAGON	DARK	STEEL	FAIRY
        //Change cell background based on pokemon type:
        switch(pokemonArray[indexPath.row].type)
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
            cell.backgroundColor = UIColor.redColor()
            break
            
        case "Ice":
            cell.backgroundColor = UIColor.redColor()
            break
            
        case "Fighting":
            cell.backgroundColor = UIColor.redColor()
            break
            
        case "Posion":
            cell.backgroundColor = UIColor.redColor()
            break
            
        case "Flying":
            cell.backgroundColor = UIColor.redColor()
            break
            
            
        case "Psychic":
            cell.backgroundColor = UIColor.redColor()
            break
            
        case "Bug":
            cell.backgroundColor = UIColor.redColor()
            break
            
        case "Rock":
            cell.backgroundColor = UIColor.redColor()
            break
            
            
        case "Ghost":
            cell.backgroundColor = UIColor.brownColor()
            break
            
        case "Dragon":
            cell.backgroundColor = UIColor.brownColor()
            break
            
        case "Steel":
            cell.backgroundColor = UIColor.brownColor()
            break
            
        case "Fairy":
            cell.backgroundColor = UIColor.purpleColor()
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
            // Delete the row from the data source
            pokemonArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            //} else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let itemToMove = pokemonArray[fromIndexPath.row]
        pokemonArray.removeAtIndex(fromIndexPath.row)
        pokemonArray.insert(itemToMove, atIndex: toIndexPath.row)
        insertItems()
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
        Pokemon = pokemonArray[indexPath.row]
        performSegueWithIdentifier("detailView", sender: self)
        
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func done(segue: UIStoryboardSegue){
        
        let editor = segue.sourceViewController as! ViewController
        let newPokemon = editor.Pokemon
        pokemonArray.append(newPokemon)
        insertItems()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        //initalPokemon()
        //fh.setArray(pokemonArray)
        //fh.loadFile()
        //pokemonArray = (fh.getArray() as? [pokemon])!
        //retrieveItems()
        
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
