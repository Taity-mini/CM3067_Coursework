//
//  PokemonTableViewController.swift
//  CM3067_Coursework
//
//  Created by Andrew Tait on 10/12/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    var pokemonArray: [pokemon] = [
        pokemon(name:"pikachu", description: "When several of these POKéMON gather, their electricity could build and cause lightning storms.", type: "Electric",  species: "Mouse Pokémon", hitPoints: 20, mainAttack: 4.0, mainDefence: 3.0)
        
    ]
    
    var Pokemon: pokemon = pokemon(name:"", description: "", type:"", species: "", hitPoints: 0.0, mainAttack: 0.0, mainDefence: 0.0)
    
    
    @IBAction func cancel(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func done(segue: UIStoryboardSegue){
        
        let editor = segue.sourceViewController as! ViewController
        let newPokemon = editor.Pokemon
        pokemonArray.append(newPokemon)
       self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemonArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pokemon", forIndexPath: indexPath)
        
        cell.textLabel!.text = pokemonArray[indexPath.row].name as String!
        
        cell.detailTextLabel!.text = pokemonArray[indexPath.row].type as String!
        
        let theURL = "https://img.pokemondb.net/artwork/" + pokemonArray[indexPath.row].name + ".jpg"
        
        cell.imageView!.image = NSURL(string:theURL)
            .flatMap { NSData(contentsOfURL: $0) }
            .flatMap { UIImage(data: $0) }
        //cell.Subtitle!.text = pokemonArray[indexPath.row].description
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detailView"){
            let dvc = segue.destinationViewController as! DetailViewController
            dvc.ChosenPokemon=Pokemon
        }
    }
    

}
