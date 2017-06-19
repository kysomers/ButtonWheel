//
//  TouchManagement+VectorFuntime.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/18/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

struct TouchManagement{
    
    static let twoPi = Double.pi * 2
    
    static func getNameFromPoint(buttonWheel : ButtonWheel, tappedPoint : CGPoint) -> String?{
        let centerPoint = CGPoint(x: buttonWheel.frame.width / 2, y: buttonWheel.frame.height / 2)
        
        let angle = angleFromPoints(centerPoint: centerPoint, tappedPoint: tappedPoint)
        let distance = CGFloat(distanceFromCenter(centerPoint: centerPoint, tappedPoint: tappedPoint))
        let numberOfButtons = buttonWheel.buttonNames.count
        
        if distance > buttonWheel.dimensionSize || distance < buttonWheel.middleRadius{
            return nil
        }
        
        let index = Int(angle * Double(numberOfButtons) / twoPi)
        
        return buttonWheel.buttonNames[index]

        
    }
    
    
    static func angleFromPoints(centerPoint : CGPoint, tappedPoint : CGPoint) -> Double{
        let translatedX = Double(tappedPoint.x - centerPoint.x)
        let translatedY = -1 * Double(tappedPoint.y - centerPoint.y) // the negative is to flip it since y in math increases as you go up

        var messedUpResult = atan(translatedY / translatedX)
        if translatedX < 0{
            messedUpResult += Double.pi
        }
        else if translatedY < 0{
            messedUpResult += twoPi
        }
        //messUpResult now follows math convention for radians
        //However for our purposes, we want it to increase clockwise and start with 0 radians on top, which is the next step
        
        var translatedResult = twoPi - messedUpResult //flips it to increase angle clockwise
        translatedResult += Double.pi / 2
        if translatedY > 0 && translatedX > 0 {
            translatedResult -= twoPi
        }
        

        
        return translatedResult
        

    }
    
    
    static func distanceFromCenter(centerPoint : CGPoint, tappedPoint : CGPoint) -> Double{
        let xdiff = centerPoint.x - tappedPoint.x
        let ydiff = (centerPoint.y - tappedPoint.y )
        let squaredDistance = xdiff * xdiff + ydiff * ydiff
        
        
        return sqrt(Double(squaredDistance))
    }
}
