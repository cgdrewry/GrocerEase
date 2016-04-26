import UIKit

class MasterListViewController: UITableViewController {
    var lists:[List] = storedLists
    var filteredLists = [List]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    func viewdidLoad() {
        super.viewDidLoad()
        
        //searchy stuff
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredLists.count
        }
        return lists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //sets reuse ID
        let cell = tableView.dequeueReusableCellWithIdentifier("list_cell", forIndexPath: indexPath)
        
        //assigns list to cell
        let list: List
        if searchController.active && searchController.searchBar.text != "" {
            list = filteredLists[indexPath.row]
        } else {
            list = lists[indexPath.row]
        }
        cell.textLabel?.text = list.name
        
        return cell
    }
    
    
    /*====================================================================
    Segue Handling
     ====================================================================*/
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("listSegue", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "listSegue" {
            let destination = (segue.destinationViewController as! SpecificListViewController)
            let row = (sender as! NSIndexPath).row
            destination.localList = lists[row]
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
            self.performSegueWithIdentifier("listSettingsSegue", sender: self)
        })
        
        //show list settings appearance
        settingsAction.backgroundColor = Colors.littleBigGreen
        
        //return [settingsAction,tagsAction, deleteAction]
        return [deleteAction, settingsAction]
    }
    
    
    /*====================================================================
     Save List
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
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredLists = lists.filter { list in
            return list.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    
    
    /*====================================================================
     Network Stuff
     ====================================================================*/
    func login() {
        let request = NSMutableURLRequest(URL: NSURL(string: "https://grocerease-capstone.herokuapp.com")!)
        request.HTTPMethod = "POST"
//        let postString = "email=tester&password=fuckingpassword"
        let postString = "email=chris&password=password_passw0rd"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // check for fundamental networking error
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in guard error == nil && data != nil else {
                print("error=\(error)")
                return
            }
            
            //check for http errors
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        
        task.resume()
    }
    
    func resgister() {
        
    }

}

extension MasterListViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}