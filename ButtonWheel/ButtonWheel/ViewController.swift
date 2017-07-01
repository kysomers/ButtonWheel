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
        
        
        
        
        let buttonNames = ["EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg"]
        let redColor : UIColor = UIColor(colorLiteralRed: 0.91, green: 0.157, blue: 0.255, alpha: 1)
        let orangeColor : UIColor = UIColor(colorLiteralRed: 0.988, green: 0.331, blue: 0.288, alpha: 1)
        var buttonColors : [UIColor] = []
        for (index, _) in buttonNames.enumerated(){
            if index % 2 == 1{
                buttonColors.append(redColor)
            }
            else{
                buttonColors.append(orangeColor)
            }
        }
        

        //myButtonWheel.setupWith(names: buttonNames, ButtonPieces: buttonNames, colors: buttonColors)
        myButtonWheel.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : ButtonWheelDelegate{
    func didTapButtonWheelAtName(name: String) {
        print(name)
    }
}

