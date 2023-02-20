//
//  SplashScreenBuilder.swift
//  YonetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit

final class SplashScreenBuilder{
    static func make() -> UIViewController {
        let viewController = SplashScreenViewController.loadFromNib()
        let viewModel = SplashScreenViewModel()
        let router = SplashScreenRouter()
        viewModel.delegate = viewController
        viewModel.router = router
        viewController.viewModel = viewModel
        router.viewController = viewController
        return viewController
    }
}

