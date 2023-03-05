//
//  Animator.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import UIKit

public class Animator {
    public static let sharedInstance = Animator()
    var transpranView = UIImageView()
    var indicator = UIActivityIndicatorView()
    
    private init() {
        transpranView.frame = UIScreen.main.bounds
        transpranView.backgroundColor = UIColor.black
        transpranView.isUserInteractionEnabled = true
        transpranView.alpha = 0.5
        indicator.center = transpranView.center
        indicator.startAnimating()
        indicator.color = .blue
        if #available(iOS 13.0, *) {
            indicator.style = UIActivityIndicatorView.Style.large
        }
    }
    func showAnimation() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            guard let controller = self.getTopVC() else { return }
            controller.view.addSubview(self.transpranView)
            controller.view.addSubview(self.indicator)
            controller.view.bringSubviewToFront(self.transpranView)
            controller.view.bringSubviewToFront(self.indicator)
        }
    }
    func hideAnimation() {
        DispatchQueue.main.async( execute: {
            self.transpranView.removeFromSuperview()
            self.indicator.removeFromSuperview()
        })
    }
    func getTopVC() -> UIViewController? {
        guard let topController = appContainer.router.window?.rootViewController else { return nil }
        return getVisibleViewControllerFrom(for: topController)
    }
    private func getVisibleViewControllerFrom(for viewController: UIViewController) -> UIViewController {
        if viewController.isKind(of: UINavigationController.self) {
            let navigationController = viewController as! UINavigationController
            return navigationController.visibleViewController!
        } else if viewController.isKind(of: UITabBarController.self) {
            let tabBarController = viewController as! UITabBarController
            return tabBarController.selectedViewController!
        } else {
            if let presentedViewController = viewController.presentedViewController {
                return presentedViewController
            } else {
                return viewController
            }
        }
    }
}

