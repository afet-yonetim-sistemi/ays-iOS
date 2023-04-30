//
//  HomeViewBuilder.swift
//  Driver
//
//  Created by Fatih Doğan on 21.02.2023.
//

import UIKit.UIViewController

final class HomeViewBuilder {
    static func make() -> UIViewController {
        let viewController = HomeViewController.loadFromNib()
        let viewModel = HomeViewModel()
        let router = HomeViewRouter()
        viewModel.delegate = viewController
        viewModel.router = router
        viewController.viewModel = viewModel
        router.viewController = viewController
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
