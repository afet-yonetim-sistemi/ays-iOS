//
//  SplashScreenRouter.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit

final class SplashScreenRouter: SplashScreenRouterProtocol{
    weak var viewController: SplashScreenViewDelegate?
    func routeToPage(_ routes: TradeRoutes) {
        guard let viewController = viewController as? UIViewController else { return }
        FirstViewController.show(from: viewController)
    }
    

}
