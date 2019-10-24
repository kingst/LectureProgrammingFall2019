import Foundation

protocol TimerUpdates {
    func updatedTime(_ time: Double)
    func runningUpdated(isRunning: Bool)
    func updatedLaps(_ laps: [Double])
}

class TimerModel {
    var startTime: Date?
    var delegate: TimerUpdates?
    var laps: [Double] = []
    var lapStartTime: Date?
    
    func timeUpdated() {
        guard let startTime = self.startTime else {
            print("not started, bail")
            return
        }
        
        let duration = -startTime.timeIntervalSinceNow
        self.delegate?.updatedTime(duration)
    }
    
    func start() {
        self.startTime = Date()
        let timer = Timer(timeInterval: 0.1, repeats: true) { _ in
            self.timeUpdated()
        }
        RunLoop.main.add(timer, forMode: .default)
    }
    
    func addLap() {
        guard let startTime = self.startTime else {
            print("timer not started")
            return
        }
        
        let now = Date()
        let lapStartTime = self.lapStartTime ?? startTime
        self.laps.append(-lapStartTime.timeIntervalSince(now))
        self.lapStartTime = now
        
        self.delegate?.updatedLaps(self.laps)
    }
    
    func stop() {
        
    }
}
