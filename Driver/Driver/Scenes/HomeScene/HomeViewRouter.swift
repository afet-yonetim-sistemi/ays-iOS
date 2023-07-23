//
//  HomeViewRouter.swift
//  Driver
//
//  Created by Fatih Doğan on 21.02.2023.
//

import UIKit.UIViewController

final class HomeViewRouter: HomeViewRouterProtocol {
    
    // MARK: Properties
    weak var viewController: HomeViewDelegate?
    
    // MARK: Functions
    func routeToPage(_ routes: HomeViewRoutes) { }
}
