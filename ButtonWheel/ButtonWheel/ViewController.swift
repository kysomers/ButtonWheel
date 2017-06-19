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
        let buttonNames = ["EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg", "EighthNoteImg"]
        let buttonColors : [UIColor] = [.red, .blue, .green, .yellow, .brown]
        
        myButtonWheel.setupWith(names: buttonNames, colors: buttonColors, buttonNamesWillBeShown: true)
        myButtonWheel.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : ButtonWheelDelegate{
    func didTapWheelButtonWithName(name: String) {
        print(name)
    }
}

