//
//  ButtonViewBuilder.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/16/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

struct ButtonViewBuilder {
    static func createPiece(buttonWheel : ButtonWheel, color : UIColor, sectionNumber : Int) -> CAShapeLayer{
        let startAngle = CGFloat(Double.pi / -2 +  Double.pi * 2 / Double(buttonWheel.numberOfSections) * Double(sectionNumber))
        let endAngle = CGFloat(Double.pi / -2 +  Double.pi * 2 / Double(buttonWheel.numberOfSections) * Double(sectionNumber + 1))
        let arcCenter = CGPoint(x: buttonWheel.backgroundView.frame.width / 2 ,y: buttonWheel.backgroundView.frame.height / 2)
        
        
        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: CGFloat((buttonWheel.dimensionSize / 2 + buttonWheel.middleRadius) / 2), startAngle: startAngle, endAngle:endAngle, clockwise: true)
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = color.cgColor
        //you can change the line width
        shapeLayer.lineWidth = buttonWheel.dimensionSize / 2 - buttonWheel.middleRadius
        
        
        
        return shapeLayer
    }
    //static func addImageToButton(buttonWheel : ButtonWheel, )
    
    static func destroyView(){
        //fill this in for method to handle button getting destroyed for if it gets reset
    }
}


