 import UIKit

class SpecificListViewController: UITableViewController {
    var localList:List!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = localList.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localList.list_items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //sets reuse ID
        let cell = tableView.dequeueReusableCellWithIdentifier("list_item_cell", forIndexPath: indexPath) as! ListItemCell
        
        //assigns item to cell
        let item = localList.list_items[indexPath.row]
        cell.item = item
        
        return cell
    }
    
    
    /*====================================================================
     Slideout Menu
     ====================================================================*/
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) ->[UITableViewRowAction]? {
        
        //delete functionality
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.localList.list_items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        })
        
        //delete appearance
//        deleteAction.backgroundColor = Colors.hotMayDay
        
        return [deleteAction]
    }
    
    
    /*====================================================================
     Save Item
     ====================================================================*/
    @IBAction func saveAddItem(segue:UIStoryboardSegue) {
        if let addItemViewController = segue.sourceViewController as? AddItemViewController {
            if let item = addItemViewController.item {
                localList.list_items.append(item)
                
                //updates tableView
                let indexPath = NSIndexPath(forRow: localList.list_items.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    /*====================================================================
     Segue Handling
     ====================================================================*/
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("detailSegue", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "detailSegue" {
            let destination = (segue.destinationViewController as! ItemDetailsViewController)
            let row = (sender as! NSIndexPath).row
            destination.localItem = localList.list_items[row]
        }
    }
    
}
