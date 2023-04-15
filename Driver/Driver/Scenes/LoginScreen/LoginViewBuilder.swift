//
//  LoginViewBuilder.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import UIKit.UIViewController

final class LoginViewBuilder {
    static func make() -> UIViewController {
        let viewController = LoginViewController.loadFromNib()
        let viewModel = LoginViewModel()
        let router = LoginViewRouter()
        viewModel.delegate = viewController
        viewModel.router = router
        viewController.viewModel = viewModel
        router.viewController = viewController
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}

