//
//  SettingsViewBuilder.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//

import UIKit.UIViewController

final class SettingsViewBuilder {
    static func make() -> UIViewController {
        let viewController = SettingsViewController.loadFromNib()
        let viewModel = SettingsViewModel()
        let router = SettingsViewRouter()
        viewModel.delegate = viewController
        viewModel.router = router
        viewController.viewModel = viewModel
        router.viewController = viewController
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
