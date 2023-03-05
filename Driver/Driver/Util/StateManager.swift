//
//  StateManager.swift
//  Driver
//
//  Created by Tolga Taner on 4.03.2023.
//

import UIKit

protocol StateManagerDelegate: AnyObject {
    func appStateDidChanged(_ state: StateManager.State)
}
protocol StateManagerProtocol: AnyObject {
    func getState() -> StateManager.State
}

final class StateManager {
    
    private var state: State
    private let notificationCenter: NotificationCenter
    weak var delegate: StateManagerDelegate?
    
    enum State: Int {
        case foreground
        case inActive
        case background
        case terminated
        case unknown
    }
    
    init(notificationCenter: NotificationCenter = NotificationCenter.default,
         delegate: StateManagerDelegate) {
        let initialStateRawValue: Int = UIApplication.shared.applicationState.rawValue
        state = StateManager.State(rawValue: initialStateRawValue) ?? .unknown
        self.notificationCenter = notificationCenter
        self.delegate = delegate
        addApplicationStateObserver()
    }
    
    private func addApplicationStateObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillTerminate), name: UIApplication.willTerminateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    @objc
    private func appWillTerminate() {
        state = .terminated
        delegate?.appStateDidChanged(state)
    }
    
    #warning("Consider: app is terminated and how with location")
    #warning(#" https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background/using_background_tasks_to_update_your_app"#)

    @objc
    private func appWillEnterForeground() {
        state = .foreground
        delegate?.appStateDidChanged(state)
    }
    
    @objc
    private func appDidEnterBackground() {
        state = .background
        delegate?.appStateDidChanged(state)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
//MARK: - StateManagerProtocol
extension StateManager: StateManagerProtocol {
    func getState() -> State {
        state
    }
}
