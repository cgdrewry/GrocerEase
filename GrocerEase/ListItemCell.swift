//class for prototype item cell
//NOT to be used with MasterListView

import UIKit
import QuartzCore

// A protocol that the TableViewCell uses to inform its delegate of state change
//protocol TableViewCellDelegate {
//    // indicates that the given item has been deleted
//    func listItemDeleted(item: Item)
//}

class ListItemCell: UITableViewCell {
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
//    var originalCenter = CGPoint()
//    var completeOnDragRelease = false
//    var itemCompleteLayer = CALayer()
    
    var item: Item! {
        didSet {
            descLabel.text = item.desc
            nameLabel.text = item.name
            quantityLabel.text = item.quantity
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // add a layer that renders a green background when an item is complete
//        itemCompleteLayer = CALayer(layer: layer)
//        itemCompleteLayer.backgroundColor = UIColor(red: 0.0, green: 0.6, blue: 0.0, alpha: 1.0).CGColor
//        itemCompleteLayer.hidden = true
//        layer.insertSublayer(itemCompleteLayer, atIndex: 0)
//        
//        // add a pan recognizer
//        var recognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
//        recognizer.delegate = self
//        addGestureRecognizer(recognizer)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    //MARK: - horizontal pan gesture methods
//    func handlePan(recognizer: UIPanGestureRecognizer) {
//        // 1
//        if recognizer.state == .Began {
//            // when the gesture begins, record the current center location
//            originalCenter = center
//        }
//        // 2
//        if recognizer.state == .Changed {
//            let translation = recognizer.translationInView(self)
//            center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
//            // has the user dragged the item far enough to initiate a delete/complete?
//            completeOnDragRelease = frame.origin.x > frame.size.width / 2.0
//        }
//        // 3
//        if recognizer.state == .Ended {
//            let originalFrame = CGRect(x: 0, y: frame.origin.y, width: bounds.size.width, height: bounds.size.height)
//            if completeOnDragRelease {
//                if item != nil {
//                    item!.completed = true
//                }
//                itemCompleteLayer.hidden = false
//                UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
//            } else {
//                UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
//            }
//        }
//    }
//    
//    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
//            let translation = panGestureRecognizer.translationInView(superview!)
//            if fabs(translation.x) > fabs(translation.y) {
//                return true
//            }
//            return false
//        }
//        return false
//    }
//    
//    let kLabelLeftMargin: CGFloat = 15.0
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        itemCompleteLayer.frame = bounds
//    }
    
}
