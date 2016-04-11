import UIKit
import CoreData

class ViewController: UIViewController {

    //let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //purely for debugging
        //print(managedObjectContext)
        
        //let newItem = NSEntityDescription.insertNewObjectForEntityForName("ListItem", inManagedObjectContext: self.managedObjectContext) as! ListItem
        
        //newItem.name = "Steak"
        //newItem.desc = "Rare"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

