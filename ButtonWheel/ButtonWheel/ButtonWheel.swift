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
    
    //border color would be something to add
    var shapes = [CAShapeLayer]()
    var buttonNames = [String]()
    var numberOfSections = 0
    var dimensionSize : CGFloat = 0

    let backgroundView =  UIView()
    var delegate : ButtonWheelDelegate?
    var middleRadius : CGFloat = 0

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
        
        self.middleRadius = dimensionSize * MiddleRadiusSize.medium.rawValue
        
        
        self.addSubview(backgroundView)
        backgroundView.backgroundColor = .clear
        backgroundView.frame.size = CGSize(width: dimensionSize, height: dimensionSize)
        backgroundView.frame.setCenter(CGPoint(x: frame.width / 2, y: frame.height / 2))
        backgroundView.layer.cornerRadius = dimensionSize / 2
        backgroundView.clipsToBounds = true


        
        
        
    }
    
    public func setupWith(buttonPieces : [ButtonPiece], middleRadius : MiddleRadiusSize){
        

        self.middleRadius = dimensionSize * middleRadius.rawValue
        self.numberOfSections = buttonPieces.count
        for aSubview in backgroundView.subviews{
            aSubview.removeFromSuperview()
        }
        
        for (index, aButtonPiece) in buttonPieces.enumerated(){
            
            let newPieceLayer = ButtonViewBuilder.createPiece(buttonWheel: self, color: aButtonPiece.color, sectionNumber: index)
            backgroundView.layer.addSublayer(newPieceLayer)
            shapes.append(newPieceLayer)
            
            
            buttonNames.append(aButtonPiece.name)
            ButtonViewBuilder.addButtonBackgroundViewToButton(buttonWheel: self, buttonPiece: aButtonPiece, sectionNumber: index)
            
            
        }
 
        
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



