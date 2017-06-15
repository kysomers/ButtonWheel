//
//  ButtonWheelPiece.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/14/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

class ButtonWheelPiece : UIView{
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    init(name : String, pictureName : String?, color : UIColor, position : Int, total : Int, buttonNamesWillBeShown : Bool) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
    }
    
}
