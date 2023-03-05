//
//  LoginViewRouter.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import UIKit.UIViewController

final class LoginViewRouter: LoginRouterProtocol {
    
    // MARK: Properties
    weak var viewController: LoginViewDelegate?
    
    /**
     LoginViewModel presents other view controllers via this method
     - parameters:
     - routes: LoginRoutes
     */
    func routeToPage(_ routes: LoginRoutes) {
        guard let viewController = viewController as? UIViewController else { return }
        let homeViewController = HomeViewBuilder.make()
        viewController.present(homeViewController, animated: true)
    }
}

