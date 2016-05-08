import UIKit
import Alamofire

class LaunchScreenViewController: UIViewController, HolderViewDelegate {
    
    var holderView = HolderView(frame: CGRectZero)
    //this needs to not be hardcoded
    var loggedIn = false
    
    var jsonArray:NSMutableArray?
    var newArray: Array<String> = []

    var slogans = ["A pun on groceries.", "The best GrocerEase on this planet.", "The human-friendly GrocerEase.", "We're serious about GrocerEase.", "Have it your way.", "Make room for the GrocerEase.", "Get up and go!", "Think small.", "Only GrocerEase has the answer.", "GrocerEase takes the waiting out of wanting.", "Simple, streamlined, savory.", "A million holidays. One GrocerEase.", "GrocerEase for inner cleanliness.", "Think fast, GrocerEase!", "GrocerEase made simple.", "Because life's complicated enough.", "Imagine that!", "Simply the best there is.", "Quality never goes out of style.", "GrocerEase: formerly TAFFEE: formerly Feed Me", "Because you need yet another app.", "Not your father's GrocerEase", "Freaky fast.", "Just do it!", "Better than a sticky note.", "Not coming to Android!", "Closed on Sundays", "Voted #1 in the nation", "Now deep fried!", "The ultimate chocolate indulgence", "Hello World!", "Baked fresh daily!", "Eat fresh!", "Now gluten free!", "Make Harps great again!", "Happiness is a warm GrocerEase", "Save money, live GrocerEase.", "Straight to DVD!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addHolderView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
            y: view.bounds.height / 2 - boxSize / 2,
            width: boxSize,
            height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        holderView.expandView()
    }
    
    func animateLabel() {
        holderView.removeFromSuperview()
        view.backgroundColor = UIColor.darkTextColor()
        
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = Colors.white
        label.font = UIFont(name: "HelveticaNeue-Light", size: 60.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "GrocerEase"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
        genLabel() //generates tagline label
        
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: ({
                label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
            }), completion: {finished in self.animTimer()
        })
    }
    
    func animatedLogo() {
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = Colors.white
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 60.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "GrocerEase"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
    }
    
    func animTimer() {
        NSTimer.scheduledTimerWithTimeInterval(1.3, target: self, selector: "segueDecision", userInfo: nil, repeats: false)
    }
    
    func segueDecision() {
        if loggedIn {
            splashSegue()
        } else {
            loginSegue()
        }
    }
    
    func splashSegue() {
        performSegueWithIdentifier("splashSegue", sender: self)
    }
    
    func loginSegue() {
        performSegueWithIdentifier("loginSegue", sender: self)
    }
    
    func genLabel() {
        for subview in view.subviews as [UIView]
        {
            if subview.tag == 97
            {
                if let label = subview as? UILabel {
                    let len = UInt32(slogans.count)
                    let randLen = arc4random_uniform(len)
                    label.text = slogans[Int(randLen)]
                    label.textColor = Colors.white
                    label.hidden = false
                }
            }
        }
    }
    
    /*====================================================================
     Network Stuff
     ====================================================================*/
    //http://www.informit.com/articles/article.aspx?p=2305797&seqNum=2
    //https://grocerease-capstone.herokuapp.com/data_manager/
    func test() {
        //easy way
        let parameters = [
            "\"foo\"": "bar",
            "baz": ["a", 1],
            "qux": [
                "x": 1,
                "y": 2,
                "z": 3
            ]
        ]
        
        Alamofire.request(.POST,
            "https://grocerease-capstone.herokuapp.com/data_manager/",
            parameters: parameters,
            encoding: .JSON)
            .responseJSON { response in
                debugPrint(response)
        }
        
        
        
//        // creating a .json file in the Documents folder
//        if !fileManager.fileExistsAtPath(jsonFilePath.absoluteString, isDirectory: &isDirectory) {
//            let created = fileManager.createFileAtPath(jsonFilePath.absoluteString, contents: nil, attributes: nil)
//            if created {
//                print("File created ")
//            } else {
//                print("Couldn't create file for some reason")
//            }
//        } else {
//            print("File already exists")
//        }
//        
//        // creating an array of test data
//        var numbers = [String]()
//        for var i = 0; i < 100; i++ {
//            numbers.append("Test\(i)")
//        }
//        
//        // creating JSON out of the above array
//        var jsonData: NSData!
//        do {
//            jsonData = try NSJSONSerialization.dataWithJSONObject(numbers, options: NSJSONWritingOptions())
//            let jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding)
//            print(jsonString)
//        } catch let error as NSError {
//            print("Array to JSON conversion failed: \(error.localizedDescription)")
//        }
//        
//        // Write that JSON to the file created earlier
//        let jsonFilePath = documentsDirectoryPath.URLByAppendingPathComponent("test.json")
//        do {
//            let file = try NSFileHandle(forWritingToURL: jsonFilePath)
//            file.writeData(jsonData)
//            print("JSON data was written to teh file successfully!")
//        } catch let error as NSError {
//            print("Couldn't write to file: \(error.localizedDescription)")
//        }
        
        
        //hard way
//        let url = NSURL(string: "https://grocerease-capstone.herokuapp.com/data_manager")
//        let request = NSMutableURLRequest(URL: url!)
//        request.HTTPMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let values = ["\"06786984572365\""]//, "06644857247565", "06649998782227"]
//        //     "\"abc\""   -escaped quotes?/bot
//
//        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(values, options: [])
//
//        Alamofire.request(request)
//            .responseJSON { response in
//                debugPrint(response)
//        }

        
    }
}