//
//  DetailViewController.swift
//  CM3067_Coursework
//
//  Created by ANDREW TAIT (1504693) on 07/12/2016.
//  Copyright © 2016 Andrew Tait. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var mainAttack: UILabel!
    @IBOutlet weak var hitPoints: UILabel!
    @IBOutlet weak var mainDefence: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
