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

    // MARK: Functions
    func routeToPage(_ routes: SplashScreenRoutes) {
        guard let viewController = viewController as? UIViewController else { return }
        switch routes {
        case .mapScreen:
            let mapViewController = HomeViewBuilder.make()
            viewController.present(mapViewController, animated: true)
        case .loginPage:
            let loginViewController = LoginViewBuilder.make()
            viewController.present(loginViewController, animated: true)
        }
    }
}
