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
    
    var buttons = [ButtonWheelPiece]()
    var borderColor  = UIColor.blue
    var middleColor = UIColor.green
    var numberOfSections = 0
    var dimensionSize : CGFloat = 0
    var showNames = true
    var showPictures = true
    let backLayer =  UIView()
    var hasDrawn = false
    
    //Any setter method for this will need to re-call setup
    public var middleRadius : CGFloat = 0
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.backgroundColor = .clear
        
        dimensionSize = self.frame.width < self.frame.height ? self.frame.width : self.frame.height
        
        self.middleRadius = dimensionSize / 4
        
        
        self.addSubview(backLayer)
        backLayer.backgroundColor = middleColor
        backLayer.frame.size = CGSize(width: dimensionSize, height: dimensionSize)
        backLayer.frame.setCenter(CGPoint(x: frame.width / 2, y: frame.height / 2))
        backLayer.layer.cornerRadius = dimensionSize / 2
        backLayer.clipsToBounds = true
        self.addTestDrawPieceToView(myView: backLayer)

    }
    
    public func setupWith(names : [String], pictureNames : [String]?, colors : [UIColor], buttonNamesWillBeShown : Bool){
        
        if  names.count !=  colors.count{
            return
        }
        if let pictureNames = pictureNames{
            if pictureNames.count != names.count{
                return
            }
        }
        else{
            showPictures = false
        }
        
        for (index, aName) in names.enumerated(){
            
            var myPicture : String? = nil
            if let pictureNames = pictureNames{
                myPicture = pictureNames[index]
            }
            let newPiece = ButtonWheelPiece(name: aName, pictureName: myPicture, color: colors[index], position: index, total: names.count, buttonNamesWillBeShown: buttonNamesWillBeShown)
            buttons.append(newPiece)
            
        }
        
        
        
    }
    
    public func setupWith(names : [String], colors : [UIColor], buttonNamesWillBeShown : Bool){
        setupWith(names: names, pictureNames: nil, colors: colors, buttonNamesWillBeShown : buttonNamesWillBeShown)
    }
    
    func addTestDrawPieceToView(myView : UIView){
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 200,y: 200), radius: CGFloat(80), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2 / 4), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 50.0
        
        myView.layer.addSublayer(shapeLayer)
        print(shapeLayer.frame)
    }
    

    
    
}


