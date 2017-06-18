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
        let buttonNames = ["Button1", "Button 2", "Button3", "Button4", "Button5"]
        let buttonColors : [UIColor] = [.red, .blue, .green, .yellow, .brown]
        
        myButtonWheel.setupWith(names: buttonNames, colors: buttonColors, buttonNamesWillBeShown: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

