//
//  ViewController.swift
//  TimerApp
//
//  Created by Sam King on 10/3/19.
//  Copyright © 2019 Sam King. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TimerUpdates, UITableViewDataSource {
    @IBOutlet weak var startStopButton: UIButton!
    var lapCount = 0
    @IBOutlet weak var lapLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    let timerModel = TimerModel()
    var laps: [Double] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timerModel.delegate = self
        tableView.dataSource = self
    }

    @IBAction func startStopButtonPress() {
        if self.startStopButton.titleLabel?.text == "Start" {
            self.timerModel.start()
        } else {
            self.timerModel.stop()
        }
        
        self.toggleButton(between: ("Start", "Stop"), on: self.startStopButton)
    }
    @IBAction func settingsPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "settingsViewController")
        let settings = vc as! SettingsViewController
        self.navigationController?.pushViewController(settings, animated: true)
    }
    
    func toggleButton(between titles: (String, String), on button: UIButton) {
        let title = button.currentTitle == titles.0 ? titles.1 : titles.0
        button.setTitle(title, for: .normal)
        
    }
    

    @IBAction func lapButtonPressed() {
        self.timerModel.addLap()
    }
    
    // MARK: timer protocol implementation
    func updatedTime(_ time: Double) {
        self.timeLabel.text = String(format: "%0.02f", time)
    }
    
    func runningUpdated(isRunning: Bool) {
        print("running updated")
    }
    
    func updatedLaps(_ laps: [Double]) {
        self.laps = laps
        self.tableView.reloadData()
    }
    
    // MARK: table view data source implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell") ?? UITableViewCell(style: .default, reuseIdentifier: "lapCell")
        let lapNumber = indexPath.row + 1
        let lapTime = String(format: "%0.02f", self.laps[indexPath.row])
        cell.textLabel?.text = "Lap \(lapNumber) \(lapTime)"
        return cell
    }
}

