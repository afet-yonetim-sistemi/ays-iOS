//
//  SettingsViewModel.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//

import UIKit.UIViewController

final class SettingsViewModel {
    
    // MARK: Propeties
    weak var delegate: SettingsViewDelegate?
    var router: SettingsViewRouterProtocol!
}
//MARK: - SettingsViewModelProtocol
extension SettingsViewModel: SettingsViewModelProtocol {
    
}
