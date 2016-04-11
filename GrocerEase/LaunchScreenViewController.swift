import UIKit

class LaunchScreenViewController: UIViewController, HolderViewDelegate {
    
    var holderView = HolderView(frame: CGRectZero)
    //this needs to not be hardcoded
    var loggedIn = true
    
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
//        view.backgroundColor = UIColor.darkGrayColor()
        view.backgroundColor = UIColor.whiteColor()
        
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = Colors.appleBlue
        label.font = UIFont(name: "HelveticaNeue-Light", size: 60.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "GrocerEase"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
        
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: ({
                label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
            }), completion: {finished in self.animTimer()
        })
    }
    
    func animatedLogo() {
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = Colors.appleBlue
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 60.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "GrocerEase"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
    }
    
    func animTimer() {
        NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: "segueDecision", userInfo: nil, repeats: false)
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
}