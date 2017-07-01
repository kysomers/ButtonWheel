//
//  VectorHelp.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/27/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

class VectorHelp {
    
    public static let twoPi = Double.pi * 2
    
    
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
        let ydiff = centerPoint.y - tappedPoint.y
        let squaredDistance = xdiff * xdiff + ydiff * ydiff
        
        
        return sqrt(Double(squaredDistance))
    }
    
    static func getCenterOfPiece(buttonWheel : ButtonWheel, sectionNumber : Int) -> CGPoint{
        
        let distance = Double(buttonWheel.dimensionSize / 2 - (buttonWheel.dimensionSize / 2 - buttonWheel.middleRadius) / 2)
        
        let ratioOfCircleToCenterOfPiece = Double(sectionNumber) / Double(buttonWheel.numberOfSections) + 0.5 / Double(buttonWheel.numberOfSections)
        let angle = twoPi * ratioOfCircleToCenterOfPiece
        let tranformedAngle = angle * -1 + Double.pi / 2 //need to transform sincr we defined a polar coordinate system that starts at the top and advances clockwise
        
        
        let uncorrectedCenter = CGPoint(x: cos(tranformedAngle) * distance , y: sin(tranformedAngle) * distance * -1)
        return CGPoint(x: uncorrectedCenter.x + buttonWheel.backgroundView.frame.midX, y: uncorrectedCenter.y + buttonWheel.backgroundView.frame.midY)
    }
    /*
    static func getLabelFrameForPiece(buttonWheel : ButtonWheel, sectionNumber : Int, buttonPiece : ButtonPiece) -> CGRect{
        //Write stuff in here
        var labelFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        labelFrame.setCenter(getCenterOfPiece(buttonWheel: buttonWheel, sectionNumber: sectionNumber))
        print(getCenterOfPiece(buttonWheel: buttonWheel, sectionNumber: sectionNumber))
        print(buttonWheel.backgroundView.frame.midX)
        return labelFrame
    }
    */
    
}
