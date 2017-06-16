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
    var numberOfSections = 5 //CHANGE THIS BACK TO 0
    var dimensionSize : CGFloat = 0
    var showNames = true
    var showPictures = true
    let backgroundView =  UIView()
    var hasDrawn = false
    
    //Any setter method for this will need to re-call setup
    public var middleRadius : CGFloat = 0
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        configureBackgroundView()
        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBackgroundView()
    }
    
    func configureBackgroundView(){
        self.backgroundColor = .clear
        
        dimensionSize = self.frame.width < self.frame.height ? self.frame.width : self.frame.height
        
        self.middleRadius = dimensionSize / 6
        
        
        self.addSubview(backgroundView)
        backgroundView.backgroundColor = middleColor
        backgroundView.frame.size = CGSize(width: dimensionSize, height: dimensionSize)
        backgroundView.frame.setCenter(CGPoint(x: frame.width / 2, y: frame.height / 2))
        backgroundView.layer.cornerRadius = dimensionSize / 2
        backgroundView.clipsToBounds = true


        
        
        
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
    
    
    

    
    
}


