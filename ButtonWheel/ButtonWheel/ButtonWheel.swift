//
//  ButtonWheel.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/14/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

class ButtonWheel : UIView{
    
    var buttons : [ButtonSection]?
    var borderColor  = UIColor.blue
    var middleColor = UIColor.green
    var numberOfSections = 0
    var dimensionSize : CGFloat = 0
    var showNames = true
    
    func setup(names : [String], pictureNames : [String], colors : [UIColor]){
        
        if names.count != pictureNames.count || names.count !=  colors.count{
            return
        }
 
        
    }
    
    func setup(names : [String], colors : [UIColor]){
        
    }
    
    required init?(coder aDecoder: NSCoder) {

        
        super.init(coder: aDecoder)
        self.backgroundColor = .clear
        
        dimensionSize = self.frame.width < self.frame.height ? self.frame.width : self.frame.height

    }
    

    
    
}

struct ButtonSection{
    
    let name : String
    let picture : UIImage?
    let color : UIColor
    
    init(name : String, picture : UIImage, color : UIColor) {
        self.name = name
        self.picture = picture
        self.color = color
    }
    init(name : String, color : UIColor) {
        self.name = name
        self.color = color
        self.picture = nil
    }
    
    
}
