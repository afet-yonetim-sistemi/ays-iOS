//
//  RepeatTimerManager.swift
//  Driver
//
//  Created by Fatih Doğan on 28.05.2023.
//

import Foundation

protocol RepeatTimerManagerDelegate: AnyObject {
    func timeIsUp()
}

/// This is a class to manage Timer
/// Use singleton pattern to reach active timer whenever want
/// For understand to working logic please examine flow charts
final class RepeatTimerManager {
    enum TimerCondition {
        case resume
        case stop
    }
    // MARK: - Properties
    private var timer: Timer?
    private var timeInterval: Double = 15
    private var timerCondition: TimerCondition = .stop
    private weak var delegate: RepeatTimerManagerDelegate?
    
    // MARK: - Init
    private init(delegate: RepeatTimerManagerDelegate?) {
        self.delegate = delegate
         }
    
    // MARK: - Functions
    /**
     Setup timer before activate timer.
     ## Important Notes ##
     Can use without setup because timeInterval variable has default value
     - parameters:
     -timeInterval: Double
     - returns:Throws error to avoid crash due to inappropriate value
     */
    func setup(timeInterval: Double) throws {
        #warning("We can add also a ceil value to prevent enter too big value")
        guard !timeInterval.isZero, timeInterval.isLess(than: 0.0) else { throw RepeatTimerManagerError.invalideTimeIntervalError }
        self.timeInterval = timeInterval
    }
    
    @objc
    private func timeIsUp() {
        delegate?.timeIsUp()
    }
    
    private func resume() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timeIsUp) , userInfo: nil, repeats: true)
    }
    
    private func stop() {
        invalidate()
    }
    
    private func invalidate() {
        timer?.invalidate()
        timer = nil
    }
    
    func transportationStatusDidChanged() {
        timerCondition = timerCondition == .resume ? .stop : .resume
        if timerCondition == .resume {
            resume()
        } else {
            stop()
        }
    }
    
    func userDidLogout() {
        invalidate()
    }
    
    func userAccountDidDeleted() {
        invalidate()
    }
    
}

enum RepeatTimerManagerError: Error {
    case invalideTimeIntervalError
    var message: String {
        switch self {
        case .invalideTimeIntervalError:
            return "Girilen değer 0 dan büyük olmalıdır."
        }
    }
}
