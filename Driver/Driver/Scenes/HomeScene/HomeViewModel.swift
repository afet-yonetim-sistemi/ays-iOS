//
//  HomeViewModel.swift
//  Driver
//
//  Created by Fatih Doğan on 21.02.2023.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: Propeties
    weak var delegate: HomeViewDelegate?
    var router: HomeViewRouterProtocol!
    var stateManager: ApplicationStateManager!
    
    init() {
        stateManager = ApplicationStateManager(delegate: self)
    }
    
    func buttonPressed(type: HomeViewButtons) {
        
    }
}

//MARK: - StateManagerDelegate
extension HomeViewModel: ApplicationStateManagerDelegate {
    func appStateDidChanged(_ state: ApplicationStateManager.State) {
        
    }
}
