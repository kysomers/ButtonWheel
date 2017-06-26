//
//  ButtonWheel.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/14/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

protocol ButtonWheelDelegate{
    func didTapButtonWheelAtName(name : String)
}

class ButtonWheel : UIView{
    
    var shapes = [CAShapeLayer]()
    var buttonNames = [String]()
    var borderColor  = UIColor.blue
    var middleColor = UIColor.clear
    var numberOfSections = 0
    var dimensionSize : CGFloat = 0
    var showNames = true
    var showPictures = true
    let backgroundView =  UIView()
    var hasDrawn = false
    var delegate : ButtonWheelDelegate?
    
    //Any setter method for this will need to re-call setup
    public var middleRadius : CGFloat = 0
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        configureBackgroundView()

        //tapRecognizer.delegate = self
        self.isUserInteractionEnabled = true


        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBackgroundView()

       // tapRecognizer.delegate = self
        self.isUserInteractionEnabled = true

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
        
        self.numberOfSections = names.count
        
        for (index, aName) in names.enumerated(){
            
            let newPiece = ButtonViewBuilder.createPiece(buttonWheel: self, color: colors[index], sectionNumber: index)
            backgroundView.layer.addSublayer(newPiece)
            shapes.append(newPiece)
            
           // print(VectorHelp.getCenterOfPiece(buttonWheel: self, sectionNumber: index)) //Doesn't go here, just for testing
            
            buttonNames.append(aName)
            
            
            var myPicture : String? = nil
            if let pictureName = pictureNames?[index]{
                myPicture = pictureName
            }
            var buttonImage = UIImage(named: myPicture!)
            ButtonViewBuilder.addImageToButton(buttonWheel: self, image: buttonImage!, sectionNumber: index)
            
            
        }
        
        
        
    }
    
    public func setupWith(names : [String], colors : [UIColor], buttonNamesWillBeShown : Bool){
        setupWith(names: names, pictureNames: nil, colors: colors, buttonNamesWillBeShown : buttonNamesWillBeShown)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let tappedPoint = touch.location(in: self)
        let buttonName = TouchManagement.getNameFromPoint(buttonWheel: self, tappedPoint: tappedPoint)
        
        guard let unwrappedButtonName = buttonName else {
            return
        }
        
        delegate?.didTapButtonWheelAtName(name: unwrappedButtonName)
        
    }
    
    
    

    
    
}



