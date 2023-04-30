//
//  TabBarControllerBuilder.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//

import UIKit.UIViewController

final class TabBarControllerBuilder {
    static func make() -> UIViewController {
        let viewController = TabBarController.loadFromNib()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
