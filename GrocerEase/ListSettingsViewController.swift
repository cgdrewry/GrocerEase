//
//  ListSettingsViewController.swift
//  GrocerEase
//
//  Created by Chris Drewry on 3/28/16.
//  Copyright © 2016 Chris Drewry. All rights reserved.
//

import UIKit

class ListSettingsViewController: UITableViewController {
    var list:List!
    var localRow:Int!
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var usersTextField: UILabel!
    @IBOutlet weak var healthySwitch: UISwitch!
    @IBOutlet weak var cheapSwitch: UISwitch!
    @IBOutlet weak var expensiveSwitch: UISwitch!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    @IBOutlet weak var mealSwitch: UISwitch!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = list.name
        usersTextField.text = list.users
        
        if list.tags[0] {
            healthySwitch.setOn(true, animated: true)
        }
        if list.tags[1] {
            cheapSwitch.setOn(true, animated: true)
        }
        if list.tags[2] {
            expensiveSwitch.setOn(true, animated: true)
        }
        if list.tags[3] {
            favoriteSwitch.setOn(true, animated: true)
        }
        if list.tags[4] {
            mealSwitch.setOn(true, animated: true)
        }
        
        healthySwitch.addTarget(self, action: Selector("switchIsChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        cheapSwitch.addTarget(self, action: Selector("switchIsChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        expensiveSwitch.addTarget(self, action: Selector("switchIsChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.groupTableViewBackgroundColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func switchIsChanged(thisSwitch: UISwitch) {
        if thisSwitch == cheapSwitch {
            if thisSwitch.on && expensiveSwitch.on {
                expensiveSwitch.setOn(false, animated: true)
            }
        }
        if thisSwitch == expensiveSwitch {
            if thisSwitch.on && cheapSwitch.on {
                cheapSwitch.setOn(false, animated: true)
            }
        }
    }
    
    //saves list settings
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveListSettings" {
            var tags = [false, false, false, false, false]
            if healthySwitch.on {
                tags[0] = true
            }
            if cheapSwitch.on {
                tags[1] = true
            } else if expensiveSwitch.on {
                tags[2] = true
            }
            if favoriteSwitch.on {
                tags[3] = true
            }
            if mealSwitch.on {
                tags[4] = true
            }
            
            list = List(name: list.name, list_items: list.list_items, tags: tags, users: list.users)
        }
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCellWithIdentifier("recur_cell", forIndexPath: indexPath)
//            return cell
//        }
//        if indexPath.section == 1 {
//            let cell = tableView.dequeueReusableCellWithIdentifier("tags_cell", forIndexPath: indexPath)
//            return cell
//        }
//        else {
//            let cell = tableView.dequeueReusableCellWithIdentifier("user_cell", forIndexPath: indexPath)
//            cell.textLabel?.text = "Chris"
//            return cell
//        }
//    }

}


//Demo
//I App
//Chris will register Carla and log in
//He will create a list
//List Name: Carla's Shopping List
//Items: Make like 4 items, with whatever details, try to take your time
//Show all the features of the app
//Tags
//Recurrence
//etc.
//Delete the list or clear the data
//Please talk a lot about the app as you are demoing
//Also this: "This is the app for GrocerEase, I made it from scratch and with love"
//
//II Website
//Taylor will login as Bob
//Bob will already have some lists
//Talk about the website, what you used to implement the smooth dashing thingy
//Make a list: Bob and Carla's Shopping List
//Make some Items
//Tag it as Something that makes sense
//Add Carla as a collaborator
//make a new list, add items, delete it
//
//Login in incognito window as Carla to show that the list was shared with her
//Edit/Add some items to the list
//Leave the list as Carla
//Go to Bob's dashboard to show that Carla is removed, Rename list to Bob and Jim's Shopping List
//Remove Carlas items, add some of jims.
//Done