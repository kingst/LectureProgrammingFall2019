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
    var lapCount = 0
    @IBOutlet weak var lapLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startStopButtonPress() {
        print("startStop press")
        self.toggleButton(between: ("Start", "Stop"), on: self.startStopButton)
    }
    @IBAction func settingsPress(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "settingsViewController")
            let settings = vc as! SettingsViewController
            self.navigationController?.pushViewController(settings, animated: true)
        }
    }
    
    func toggleButton(between titles: (String, String), on button: UIButton) {
        let title = button.currentTitle == titles.0 ? titles.1 : titles.0
        button.setTitle(title, for: .normal)
        
    }
    

    @IBAction func lapButtonPressed() {
        self.lapCount += 1
        print("Lap button pressed \(self.lapCount)")
        self.lapLabel.text = "Lap: \(self.lapCount)"
    }
}

