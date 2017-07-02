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
    static func addButtonBackgroundViewToButton(buttonWheel : ButtonWheel, buttonPiece : ButtonPiece, sectionNumber : Int){
        //let imageView = UIImageView(frame: VectorHelp.getLabelFrameForPiece(buttonWheel: buttonWheel, sectionNumber: sectionNumber))
       // imageView.image = image
        //imageView.backgroundColor = UIColor.purple
        var pieceCenter = VectorHelp.getCenterOfPiece(buttonWheel: buttonWheel, sectionNumber: sectionNumber)
        print(pieceCenter)
        buttonPiece.backgroundView.frame.setCenter(CGPoint(x: pieceCenter.x + buttonPiece.offsetFromDefaultCenter.x, y: pieceCenter.y + buttonPiece.offsetFromDefaultCenter.y))
        
        buttonWheel.backgroundView.addSubview(buttonPiece.backgroundView)
        

        
        
    }
    static func updateImageSizes(){
//        center + length * (1,1) >
//        
//        while(1){
//            checkIfTooFar = add (1, height/width) to centerOfImage
//            if distance(center, checkIfTooFar) > outerDonutRadius || distance(center, checkIfTooFar) < innerDonutRadius{
//                
//                
//            }
//        }
        
    }
    
    static func destroyView(){
        //fill this in for method to handle button getting destroyed for if it gets reset
    }
}


