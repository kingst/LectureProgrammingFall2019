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
    
    func timeUpdated() {
        
    }
    
    func start() {
        self.startTime = Date()
        let timer = Timer(timeInterval: 0.1, repeats: true) { _ in
            self.timeUpdated()
        }
        RunLoop.main.add(timer, forMode: .default)
    }
    
    func lap() {
        
    }
    
    func stop() {
        
    }
}
