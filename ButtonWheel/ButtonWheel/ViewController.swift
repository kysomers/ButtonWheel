//
//  ViewController.swift
//  ButtonWheel
//
//  Created by Kyle Somers on 6/14/17.
//  Copyright © 2017 Kyle Somers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButtonWheel: ButtonWheel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(colorLiteralRed: 0.157, green: 0.169, blue: 0.208, alpha: 1)

        myButtonWheel.setupWith(buttonPieces: makeButtonArray(), middleRadius: .medium)

        myButtonWheel.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //This is an example of how we could make an array of orange and red button pieces with whatever names and labels we want
    func makeButtonArray() -> [ButtonPiece]{
        
        let redColor : UIColor = UIColor(colorLiteralRed: 0.91, green: 0.157, blue: 0.255, alpha: 1)
        let orangeColor : UIColor = UIColor(colorLiteralRed: 0.988, green: 0.331, blue: 0.288, alpha: 1)
        
        let buttonImageNames = ["EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg"]
        let imageSize = CGSize(width: 50, height: 50)
        
        let buttonNames = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6", "Button 7", "Button 8"]
        let myFont = UIFont(name: "Avenir", size: 12)
        let fontColor = UIColor.black
        let labelLength : CGFloat = 50
        
        var buttonArray : [ButtonPiece] = []
        
        for (index, aName) in buttonNames.enumerated(){
            var myColor = UIColor()
            if index % 2 == 1{
                myColor = redColor
            } else{
                myColor = orangeColor
            }
            
            var newButton = ButtonPiece(name: aName, color: myColor, centerOffset: CGPoint(x: 0, y: 0))
            
            
            if let myImage = UIImage(named: buttonImageNames[index]){
                newButton.setImage(image: myImage, imageViewSize:imageSize)

            }
            else{
                print("Used invalid image name")
            }
            
            
            
            if let myFont = myFont{
                newButton.setLabel(maxLabelWidth: labelLength, labelFont: myFont, textColor: fontColor)

            }
            else{
                print("Must use valid font")
            }
            
            
            buttonArray.append(newButton)

        }
        
        
        
        return buttonArray
    }


}

extension ViewController : ButtonWheelDelegate{
    func didTapButtonWheelAtName(name: String) {
        print(name)
    }
}

