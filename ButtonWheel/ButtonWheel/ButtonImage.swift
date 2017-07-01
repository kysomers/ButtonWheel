//
//  ButtonImage.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/28/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import Foundation
import UIKit

public struct ButtonPiece {
    
    var offsetFromDefaultCenter = CGPoint(x: 0, y: 0)
    private var nameLabel : UILabel?
    private var imageView : UIImageView?
    var backgroundView : UIView
    var name : String
    var color : UIColor

    init(name : String, color : UIColor) {
        self.name = name
        self.color = color
        self.backgroundView = UIView()
        
    }
    
    mutating func setImage(image: UIImage, imageViewSize : CGSize, centerOffset : CGPoint){
        imageView = UIImageView(image: image)
        imageView?.frame = CGRect(x: 0, y: 0, width: imageViewSize.width, height: imageViewSize.height)
        self.offsetFromDefaultCenter = centerOffset
        
        configureSubviews()
    }
    
    mutating func setLabel(labelWidth : CGFloat, labelFont : UIFont, labelColor : UIColor, centerOffset : CGPoint){
        nameLabel = UILabel()
        nameLabel?.text = self.name
        nameLabel?.textColor = labelColor
        nameLabel?.font = labelFont
        nameLabel?.numberOfLines = 0
        nameLabel?.frame.size = CGSize(width: labelWidth, height: 0)
        nameLabel?.sizeToFit()
        self.offsetFromDefaultCenter = centerOffset
        
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
