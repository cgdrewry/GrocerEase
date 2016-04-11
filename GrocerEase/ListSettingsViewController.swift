//
//  ListSettingsViewController.swift
//  GrocerEase
//
//  Created by Chris Drewry on 3/28/16.
//  Copyright © 2016 Chris Drewry. All rights reserved.
//

import UIKit

class ListSettingsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        //header.contentView.backgroundColor = UIColor(red: 0/255, green: 181/255, blue: 229/255, alpha: 1.0) //make the background color light blue
//        header.textLabel?.textColor = UIColor.whiteColor() //make the text white
        //header.alpha = 0.5 //make the header transparent
    }

}
