//
//  MessagesViewBuilder.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//

import UIKit.UIViewController

final class MessagesViewBuilder {
    static func make() -> UIViewController {
        let viewController = MessagesViewController.loadFromNib()
        let viewModel = MessagesViewModel()
        let router = MessagesViewRouter()
        viewModel.delegate = viewController
        viewModel.router = router
        viewController.viewModel = viewModel
        router.viewController = viewController
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
