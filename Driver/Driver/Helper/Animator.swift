//
//  Animator.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import UIKit

/// This is a class to contain a activty indicator layer
final class Animator {
    static let shared = Animator()
    var transparentView = UIView()
    var indicator = UIActivityIndicatorView()
    
    private init() {
        transparentView.frame = UIScreen.main.bounds
        transparentView.backgroundColor = UIColor.black
        transparentView.isUserInteractionEnabled = true
        transparentView.alpha = 0.5
        indicator.center = transparentView.center
        indicator.startAnimating()
        indicator.color = .blue
        if #available(iOS 13.0, *) {
            indicator.style = UIActivityIndicatorView.Style.large
        }
    }
    /**
     This method is used to show a transparent view with activty indicator
     - parameters:
     -viewController: UIViewController
     */
    func showAnimation(viewController: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            var controller: UIViewController!
            if let navController = viewController.navigationController {
              controller = navController
            } else {
                controller = viewController
            }
            controller.view.addSubview(self.transparentView)
            controller.view.addSubview(self.indicator)
            controller.view.bringSubviewToFront(self.transparentView)
            controller.view.bringSubviewToFront(self.indicator)
        }
    }
    /**
     This method is used to hide activty indicator
     */
    func hideAnimation() {
        DispatchQueue.main.async( execute: { [weak self] in
            guard let self else { return }
            self.transparentView.removeFromSuperview()
            self.indicator.removeFromSuperview()
        })
    }
}

