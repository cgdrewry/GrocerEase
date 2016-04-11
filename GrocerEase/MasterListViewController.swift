import UIKit
import CoreData

class MasterListViewController: UITableViewController {
    var lists:[List] = storedLists
    
    func viewdidLoad() {
        super.viewDidLoad()
        //self.loadLists()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //sets reuse ID
        let cell = tableView.dequeueReusableCellWithIdentifier("list_cell", forIndexPath: indexPath)
        
        //assigns list to cell
        let list = lists[indexPath.row]
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
//        deleteAction.backgroundColor = Colors.hotMayDay
        
        // show list tags functionality
        let tagsAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Tags" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            // what happens when action pressed
        })
        
        //show list appearance
//        tagsAction.backgroundColor = Colors.littleBigGreen
        
        // show list settings functionality
        let settingsAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Settings" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            // what happens when action pressed
            self.performSegueWithIdentifier("listSettingsSegue", sender: self)
        })
        
        //show list settings appearance
        //settingsAction.backgroundColor = Colors.richVein
//        settingsAction.backgroundColor = Colors.littleBigGreen
        
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

}
