//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit.UIViewController

final class ___VARIABLE_productName:identifier___ViewBuilder {
    static func make() -> UIViewController {
        let viewController = ___VARIABLE_productName:identifier___ViewController.loadFromNib()
        let viewModel = ___VARIABLE_productName:identifier___ViewModel()
        let router = ___VARIABLE_productName:identifier___ViewRouter()
        viewModel.delegate = viewController
        viewModel.router = router
        viewController.viewModel = viewModel
        router.viewController = viewController
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
