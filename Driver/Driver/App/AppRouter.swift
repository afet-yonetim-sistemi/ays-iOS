//
//  AppRouter.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

import UIKit

final class AppRouter {
    var window: UIWindow?
    
    @available(iOS 13.0, *)
    func start(_ scene: UIWindowScene) {
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        let controller = SplashScreenBuilder.make()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    func start() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller = SplashScreenBuilder.make()
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
    }
}
