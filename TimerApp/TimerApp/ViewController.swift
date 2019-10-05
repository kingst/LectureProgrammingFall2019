//
//  ViewController.swift
//  TimerApp
//
//  Created by Sam King on 10/3/19.
//  Copyright © 2019 Sam King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startStopButton: UIButton!
    var lapCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startStopButtonPress() {
        print("startStop press")
        self.toggleButton(between: ("Start", "Stop"), on: self.startStopButton)
        //self.dontUse("hello")
        //self.useIfYouWant(foo: "bar")
    }
    
    func toggleButton(between titles: (String, String), on button: UIButton) {
        let title = button.currentTitle == titles.0 ? titles.1 : titles.0
        button.setTitle(title, for: .normal)
        
    }
    
    /*
    func dontUse(_ foo: String) {
        
    }*/
    
    /*
    func useIfYouWant(foo: String) {
        
    }*/
    @IBAction func lapButtonPressed() {
        self.lapCount += 1
        print("Lap button pressed \(self.lapCount)")
    }
}

