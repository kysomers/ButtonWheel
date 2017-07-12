//
//  ButtonPiece.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/28/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

public struct ButtonPiece {
    
    var offsetFromDefaultCenter = CGPoint(x: 0, y: 0)
    var nameLabel : UILabel?
    var imageView : UIImageView?
    var backgroundView : UIView
    var name : String
    var color : UIColor
    
    public init(name : String, color : UIColor, centerOffset : CGPoint) {
        self.name = name
        self.color = color
        self.backgroundView = UIView()
        self.offsetFromDefaultCenter = centerOffset
        
        
    }
    
    public mutating func setImage(image: UIImage, imageViewSize : CGSize, tintColor : UIColor?){
        if let imageView = self.imageView{
            imageView.removeFromSuperview()
        }

        imageView = UIImageView(image: image)
        
        if let tintColor = tintColor{
            imageView?.tintColor = tintColor
        }
        imageView?.frame = CGRect(x: 0, y: 0, width: imageViewSize.width, height: imageViewSize.height)
        
        configureSubviews()
    }
    
    public mutating func setLabel(maxLabelWidth : CGFloat, labelFont : UIFont, textColor : UIColor){
        if let nameLabel = self.nameLabel{
            nameLabel.removeFromSuperview()
        }
        nameLabel = UILabel()
        nameLabel?.text = self.name
        nameLabel?.textColor = textColor
        nameLabel?.font = labelFont
        nameLabel?.numberOfLines = 0
        nameLabel?.frame.size = CGSize(width: maxLabelWidth, height: 0)
        nameLabel?.sizeToFit()
        
        configureSubviews()
    }
    
    func configureSubviews(){
        for aSubview in backgroundView.subviews{
            aSubview.removeFromSuperview()
        }
        if let imageView = imageView, let nameLabel = nameLabel{
            let backgroundHeight = imageView.frame.height + nameLabel.frame.height
            let backgroundWidth = imageView.frame.width > nameLabel.frame.width ? imageView.frame.width : nameLabel.frame.width
            backgroundView.frame = CGRect(x: 0, y: 0, width: backgroundWidth, height: backgroundHeight)
            
            imageView.frame.setCenter(CGPoint(x: backgroundWidth / 2 + offsetFromDefaultCenter.x, y: imageView.frame.midY + offsetFromDefaultCenter.y))
            backgroundView.addSubview(imageView)
            
            
            nameLabel.frame.setCenter(CGPoint(x: backgroundWidth / 2 + offsetFromDefaultCenter.x, y: imageView.frame.maxY + nameLabel.frame.height / 2 + offsetFromDefaultCenter.y))
            backgroundView.addSubview(nameLabel)
            
        }
            
        else if let imageView = imageView{
            imageView.frame = CGRect(origin: CGPoint(x: offsetFromDefaultCenter.x, y: offsetFromDefaultCenter.y), size: imageView.frame.size)
            backgroundView.frame = imageView.frame
            backgroundView.addSubview(imageView)
        }
            
        else if let nameLabel = nameLabel{
            nameLabel.frame = CGRect(origin: CGPoint(x: offsetFromDefaultCenter.x, y: offsetFromDefaultCenter.y), size: nameLabel.frame.size)
            backgroundView.frame = nameLabel.frame
            backgroundView.addSubview(nameLabel)
        }
    }
    
    
    
    
}

