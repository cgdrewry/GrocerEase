import UIKit

class MasterListViewController: UITableViewController, UIAlertViewDelegate {
    var lists:[List] = storedLists
//    var filteredLists = [List]()
//    var searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBAction func userAlert(sender: AnyObject) {
        // Initialize Alert View
        let alertView = UIAlertView(title: "Not " + user + "?", message: "Log your bad self in!", delegate: self, cancelButtonTitle: "Logout", otherButtonTitles: "Cancel")
        
        // Configure Alert View
        alertView.tag = 1
        
        // Show Alert View
        alertView.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 1 {
            if buttonIndex == 0 {
                self.performSegueWithIdentifier("logoutSegue", sender: nil)
            }
        }
    }
    
    func viewdidLoad() {
        super.viewDidLoad()
        
//        searchBar.delegate = self
//        filteredLists = lists
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*====================================================================
     Table View
     ====================================================================*/
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searchController.active && searchController.searchBar.text != "" {
//            return filteredLists.count
//        }
        return lists.count
//        return filteredLists.count
    }
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 44))
//        headerView = searchController.searchBar
//        tableView.tableHeaderView = searchController.searchBar
//        return headerView
//    }
    
    //TAGS:
    //healthy = 0, unhealthy = 1, cheap = 2, expensive = 3, meal = 4

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("list_cell", forIndexPath: indexPath) as! ListCell
//        let list: List
//        if searchController.active && searchController.searchBar.text != "" {
//            list = filteredLists[indexPath.row]
//            cell.textLabel?.text = list.name
//        } else {
//            list = lists[indexPath.row]
//            cell.textLabel?.text = list.name
//        }
        
//        let list = filteredLists[indexPath.row]
        
        
        let list = lists[indexPath.row]
//        cell.textLabel?.text = list.name
//        cell.textLabel?.textColor = UIColor.groupTableViewBackgroundColor()
        cell.list = list
        return cell
    }
    
    
    /*====================================================================
    Segue Handling
     ====================================================================*/
    //listSegue
    //listSettingsSegue
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("listSegue", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "listSegue" {
            let destination = (segue.destinationViewController as! SpecificListViewController)
            let row = (sender as! NSIndexPath).row
            destination.localList = lists[row]
        }
        if segue.identifier == "listSettingsSegue" {
            let destination = (segue.destinationViewController as! ListSettingsViewController)
            let row = (sender as! NSIndexPath).row
            destination.list = lists[row]
        }
    }
    
    
    /*====================================================================
    Slideout Menu
    ====================================================================*/
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
        
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) ->[UITableViewRowAction]? {
    
        
        //delete functionality
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.lists.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        })
        
        //delete appearance
        deleteAction.backgroundColor = Colors.hotMayDay
        
        // show list tags functionality
        let tagsAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Tags" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            // what happens when action pressed
        })
        
        //show list appearance
        tagsAction.backgroundColor = Colors.littleBigGreen
        
        // show list settings functionality
        let settingsAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Settings" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            // what happens when action pressed
            self.performSegueWithIdentifier("listSettingsSegue", sender: indexPath)
        })
        
        //show list settings appearance
        settingsAction.backgroundColor = Colors.littleBigGreen
        
        //return [settingsAction,tagsAction, deleteAction]
        return [deleteAction, settingsAction]
    }
    
    
    /*====================================================================
     Save List or Settings
     ====================================================================*/
    @IBAction func saveAddList(segue:UIStoryboardSegue) {
        if let addListViewController = segue.sourceViewController as? AddListViewController {
            if let list = addListViewController.list {
                lists.append(list)
                
                //updates tableView
                let indexPath = NSIndexPath(forRow: lists.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    /*====================================================================
     Search
     ====================================================================*/
    //https://github.com/codepath/ios_guides/wiki/Search-Bar-Guide
//    func filterContentForSearchText(searchText: String, scope: String = "All") {
//        filteredLists = lists.filter { list in
//            return list.name.lowercaseString.containsString(searchText.lowercaseString)
//        }
//        
//        tableView.reloadData()
//    }
    
//    func searchyBar() {
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        definesPresentationContext = true
//        tableView.tableHeaderView = searchController.searchBar
//    }
    
//    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredLists = searchText.isEmpty ? lists : lists.filter({(listString: String) -> Bool in
//            return listString.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
//        })
//        
//    }
//    
    // This method updates filteredData based on the text in the Search Box
//    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        // When there is no text, filteredData is the same as the original data
//        if searchText.isEmpty {
//            filteredLists = lists
//        } else {
//            // The user has entered text into the search box
//            // Use the filter method to iterate over all items in the data array
//            // For each item, return true if the item should be included and false if the
//            // item should NOT be included
//            filteredLists = lists.filter({(listItem: Item) -> Bool in
//                // If dataItem matches the searchText, return true to include it
//                if dataItem.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
//                    return true
//                } else {
//                    return false
//                }
//            })
//        }
//        tableView.reloadData()
//    }


}

//extension MasterListViewController: UISearchResultsUpdating {
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        filterContentForSearchText(searchController.searchBar.text!)
//    }
//}

/*
 UI NOTES
 
 Colored lists based on tag color
 Stylized list header
 */