//
//  UsefulExtensions.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/14/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    
    
    
    mutating func setCenter(_ point : CGPoint){
        self.origin = CGPoint(x: point.x - self.width / 2, y: point.y - self.height / 2)
    }
}
