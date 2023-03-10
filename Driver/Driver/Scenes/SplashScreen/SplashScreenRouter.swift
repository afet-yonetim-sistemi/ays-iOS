//
//  SplashScreenRouter.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit.UIViewController

final class SplashScreenRouter: SplashScreenRouterProtocol {
    
    // MARK: Properties
    weak var viewController: SplashScreenViewDelegate?
    deinit {
        print("deinit:", "SplashScreenRouter")
    }
    // MARK: Functions
    func routeToPage(_ routes: SplashScreenRoutes) {
        guard let viewController = viewController as? UIViewController else { return }
        let loginViewController = LoginViewBuilder.make()
        viewController.present(loginViewController, animated: true)
    }
}
