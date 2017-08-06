//
//  ExampleCell.swift
//  LWTableViewCell
//
//  Created by Paolo Arduin on 06/08/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import LWTableViewCell

class ExampleCell: LWTableViewCell {
    
    static let identifier = "ExampleCellIdentifier"
    
    var element: ExampleElement? {
        didSet {
            // Needed to call drawCellView(_ frame: CGRect) and draw contents
            self.setNeedsDisplay()
        }
    }
    
    // MARK: -
    
    static func estimatedHeight() -> CGFloat {
        return 60.0
    }
    
    override func drawCellView(_ frame: CGRect) {
        guard let element = self.element else {
            return
        }
        
        // Margins
        let topMargin: CGFloat = 10.0
        let leftMargin: CGFloat = 10.0
        let bottomMargin: CGFloat = 10.0
        let gapMargin: CGFloat = 40.0
        
        // Image side
        let imageSide: CGFloat = ExampleCell.estimatedHeight()
            - topMargin
            - bottomMargin
        
        // Draw image
        var imageRect = CGRect.zero
        imageRect.origin.x = leftMargin
        imageRect.origin.y = topMargin
        imageRect.size.width = imageSide
        imageRect.size.height = imageSide
        element.image.draw(in: imageRect.integral)
        
        // Draw title
        let titleAttributes = [NSForegroundColorAttributeName: UIColor.black,
                               NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)]
        let titleAttributedString = NSAttributedString.init(string: element.title,
                                                            attributes: titleAttributes)
        var titleRect = CGRect.zero
        titleRect.size = titleAttributedString.size()
        titleRect.origin.x = imageRect.maxX
            + gapMargin
        titleRect.origin.y = ceil(frame.height / 2.0)
            - ceil(titleRect.height / 2.0)
        titleAttributedString.draw(in: titleRect)
    }
}
