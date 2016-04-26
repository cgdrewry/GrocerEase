//
//  SearchViewController.swift
//  GrocerEase
//
//  Created by Chris Drewry on 4/25/16.
//  Copyright © 2016 Chris Drewry. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    var lists:[List] = storedLists
    var filteredLists = [List]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
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
        if searchController.active && searchController.searchBar.text != "" {
            return filteredLists.count
        }
        return lists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("search_cell", forIndexPath: indexPath)
        
        let list: List
        if searchController.active && searchController.searchBar.text != "" {
            list = filteredLists[indexPath.row]
        } else {
            list = lists[indexPath.row]
        }
        cell.textLabel?.text = list.name
//        cell.detailTextLabel?.text = list.tags
        return cell
    }

    
    /*====================================================================
     Search
     ====================================================================*/
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredLists = lists.filter { list in
            return list.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }

}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
