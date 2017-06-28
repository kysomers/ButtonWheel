//
//  ButtonImage.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/28/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

class ButtonImageView : UIImageView{
    public var offsetFromDefaultCenter = CGPoint(x: 0, y: 0)
    var nameLabel : UILabel
    
    
    init(image: UIImage?, nameLabel : UILabel) {
        self.nameLabel = nameLabel
        
        super.init(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Button Image View Must be constructed programmatically, not from a storyboard")
    }
        
    
    
}
