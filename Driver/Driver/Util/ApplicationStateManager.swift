//
//  ApplicationStateManager.swift
//  Driver
//
//  Created by Tolga Taner on 4.03.2023.
//

import UIKit

protocol ApplicationStateManagerDelegate: AnyObject {
    func appStateDidChanged(_ state: ApplicationStateManager.State)
}
protocol ApplicationStateTrackable: AnyObject {
    func getState() -> ApplicationStateManager.State
}

final class ApplicationStateManager {
    
    private var state: State
    private let notificationCenter: NotificationCenter
    weak var delegate: ApplicationStateManagerDelegate?
    
    enum State: Int {
        case foreground
        case inActive
        case background
        case terminated
        case unknown
    }
    
    init(notificationCenter: NotificationCenter = NotificationCenter.default,
         delegate: ApplicationStateManagerDelegate) {
        let initialStateRawValue: Int = UIApplication.shared.applicationState.rawValue
        state = ApplicationStateManager.State(rawValue: initialStateRawValue) ?? .unknown
        self.notificationCenter = notificationCenter
        self.delegate = delegate
        addApplicationStateObserver()
    }
    
    /**
     It adds application observers to track state of the application along its life cycle.
     - parameters: nil
     */
    private func addApplicationStateObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillTerminated), name: UIApplication.willTerminateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    /**
     It is an observer method that is triggers when the app is terminated.
     - parameters: nil
     */
    @objc
    private func appWillTerminated() {
        state = .terminated
        delegate?.appStateDidChanged(state)
    }
    
    #warning("Tolga: Consider that the app is terminated and how it is going with user's location updating. It doesn't work")
    //"https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background/using_background_tasks_to_update_your_app""

    /**
     It is an observer method that is triggers when the app enters foreground.
     - parameters: nil
     */
    @objc
    private func appWillEnterForeground() {
        state = .foreground
        delegate?.appStateDidChanged(state)
    }
    
    /**
     It is an observer method that is triggers when the app enters background.
     - parameters: nil
     */
    @objc
    private func appDidEnterBackground() {
        state = .background
        delegate?.appStateDidChanged(state)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
//MARK: - ApplicationStateTrackable
extension ApplicationStateManager: ApplicationStateTrackable {
    /**
     Returns state of current life cycle state.
     - parameters: nil
     */
    func getState() -> State {
        state
    }
}
