import UIKit

protocol HolderViewDelegate:class {
    func animateLabel()
}

class HolderView: UIView {
    
    var parentFrame :CGRect = CGRectZero
    weak var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func expandView() {
        backgroundColor = Colors.clear
        layer.sublayers = nil
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                self.frame = self.parentFrame
            }, completion: { finished in
                self.addLabel()
        })
    }
    
    func addLabel() {
        delegate?.animateLabel()
    }
}
