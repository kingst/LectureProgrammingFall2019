//
//  ViewController.swift
//  CardScan
//
//  Created by Sam King on 11/7/18.
//  Copyright © 2018 Sam King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var embossedNumber: UILabel!
    @IBOutlet weak var flatNumber: UILabel!
    @IBOutlet weak var answer: UILabel!
    
    var image = #imageLiteral(resourceName: "green_dot")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func characterBoxes(from boundingBox: CGRect) -> [CGRect] {
        // divide the bounding box into 16 even width parts
        let dx = boundingBox.width / 16.0
        return stride(from: boundingBox.origin.x, to: boundingBox.size.width + boundingBox.origin.x, by: dx)
            .map { CGRect(x: $0, y: boundingBox.origin.y, width: dx, height: boundingBox.height) }
    }
    
    func detectNumberEmbossed(image: UIImage) -> [CGRect] {
        Thread.sleep(until: Date() + 3.0)
        print("checking predicted embossed number")
        return characterBoxes(from: CGRect(x: 10, y: 120, width: 480, height: 40))
    }
    
    func detectNumberFlat(image: UIImage) -> [CGRect] {
        Thread.sleep(until: Date() + 2.0)
        print("checking predicted flat number")
        return characterBoxes(from: CGRect(x: 10, y: 10, width: 240, height: 28))
    }
    
    func recognizeCharacters(image: UIImage, characterBox: CGRect) -> String {
        Thread.sleep(until: Date() + 0.1)
        return "9"
    }
    
    func pickNumber(flat: String, embossed: String) -> String? {
        return flat
    }
    
    @IBAction func performOcr() {
        let embossedBoxes = self.detectNumberEmbossed(image: self.image)
        let embossedNumber = embossedBoxes.map { self.recognizeCharacters(image: self.image, characterBox: $0) }.joined()
        let flatBoxes = self.detectNumberFlat(image: self.image)
        let flatNumber = flatBoxes.map { self.recognizeCharacters(image: self.image, characterBox: $0) }.joined()
        
        let answer = self.pickNumber(flat: flatNumber, embossed: embossedNumber)
        
        self.embossedNumber.text = embossedNumber
        self.flatNumber.text = flatNumber
        self.answer.text = answer
    }
    
}

