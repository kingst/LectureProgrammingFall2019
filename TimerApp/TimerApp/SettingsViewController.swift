//
//  SettingsViewController.swift
//  TimerApp
//
//  Created by Sam King on 10/15/19.
//  Copyright © 2019 Sam King. All rights reserved.
//

import UIKit

class SettingsViewController: ViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.becomeFirstResponder()
        self.textField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currentText = textField.text, let swiftRange = Range(range, in: currentText) else {
            print("somethihng is wrong")
            return true
        }
        
        let nextText = currentText.replacingCharacters(in: swiftRange, with: string)
        
        print("Current text -> \(currentText)")
        print("Next text    ~> \(nextText)")
        print("")
        
        textField.text = nextText.uppercased()
        
        if nextText.starts(with: "BOB") {
            self.textField.resignFirstResponder()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        return false
    }
}
