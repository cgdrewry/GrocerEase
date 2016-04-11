import UIKit

class AddListViewController: UITableViewController {
    //list to be saved
    var list:List?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tagsTextField: UITextField!

    //logs init and deinit of add item page to NSLog
    //uncomment prints for debugging if needed
    required init?(coder aDecoder: NSCoder) {
        //print("init AddItemViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        //print("deinit AddItemViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
    
    //sends list to be saved
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveAddList" {
            list = List(name: nameTextField.text!, list_items: [Item]())
        }
    }

}
