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
    
    required init?(names : [String], pictureNames : [String], colors : [UIColor]){
        
        if names.count != pictureNames.count || names.count !=  colors.count{
            return nil
        }
 
        super.init(frame : CGRect(x: 0, y: 0, width: 0, height: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
}

struct ButtonSection{
    
    let name : String
    let picture : UIImage
    let color : UIColor
    
    init(name : String, picture : UIImage, color : UIColor) {
        self.name = name
        self.picture = picture
        self.color = color
    }
    
    
}
