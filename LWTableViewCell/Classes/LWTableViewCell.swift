import Foundation
import UIKit

private class LWTableViewCellView : UIView {
    
    required convenience init() {
        self.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        self.contentMode = UIViewContentMode.redraw
        self.isOpaque = true
    }
    
    override fileprivate func draw(_ rect: CGRect) {
        if let superview = self.superview as? LWTableViewCell {
            superview.drawCellView(rect)
        }
    }
}

open class LWTableViewCell: UITableViewCell {
    
    override open var frame: CGRect {
        set {
            super.frame = newValue
            self.cellView.frame = self.bounds
        }
        get {
            return self.cellView.frame
        }
    }
    
    let cellView: UIView = LWTableViewCellView()
    
    
    // MARK: -
    
    override required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(self.cellView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    // MARK: -
    
    override open func setNeedsDisplay() {
        super.setNeedsDisplay()
        self.cellView.setNeedsDisplay()
    }
    
    override open func setNeedsDisplay(_ rect: CGRect) {
        super.setNeedsDisplay(rect)
        self.cellView.setNeedsDisplay(rect)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        self.accessoryView?.removeFromSuperview()
        self.backgroundView?.removeFromSuperview()
        self.contentView.removeFromSuperview()
        self.detailTextLabel?.removeFromSuperview()
        self.imageView?.removeFromSuperview()
        self.multipleSelectionBackgroundView?.removeFromSuperview()
        self.selectedBackgroundView?.removeFromSuperview()
        self.textLabel?.removeFromSuperview()
    }
    
    // MARK: -
    
    open func drawCellView(_ frame: CGRect) {
        assert(false, "Subclasses must override this")
    }
}
