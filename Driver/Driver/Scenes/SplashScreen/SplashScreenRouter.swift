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
        let homeViewController = HomeViewBuilder.make()
        viewController.present(homeViewController, animated: true)
    }
}
