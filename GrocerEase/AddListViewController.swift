import UIKit

class AddListViewController: UITableViewController, UITextFieldDelegate {
    //list to be saved
    var list:List?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usersTextField: UITextField!
    @IBOutlet weak var healthySwitch: UISwitch!
    @IBOutlet weak var cheapSwitch: UISwitch!
    @IBOutlet weak var expensiveSwitch: UISwitch!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    @IBOutlet weak var mealSwitch: UISwitch!

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
        
        self.nameTextField.delegate = self
        self.usersTextField.delegate = self
        
        healthySwitch.addTarget(self, action: Selector("switchIsChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        cheapSwitch.addTarget(self, action: Selector("switchIsChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        expensiveSwitch.addTarget(self, action: Selector("switchIsChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        //header.contentView.backgroundColor = UIColor(red: 0/255, green: 181/255, blue: 229/255, alpha: 1.0) //make the background color light blue
//        header.textLabel?.textColor = UIColor.whiteColor() //make the text white
        header.textLabel?.textColor = UIColor.groupTableViewBackgroundColor()
        //header.alpha = 0.5 //make the header transparent
    }
    
    //sends list to be saved
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveAddList" {
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
            list = List(name: nameTextField.text!, list_items: [Item](), tags: tags, users: usersTextField.text!)
        }
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}


//cheap #f1c40f
//expensive #e67e22
//healthy #2ecc71
//favorite #e74c3c
//meal #3498db