//
//  TabBarController.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//

import UIKit.UIViewController

final class TabBarController: UITabBarController {
    private var tabBarView : TabBarView!
    
    override func viewDidLoad() {
        selectedIndex = 0
        let homeViewModel = HomeViewBuilder.make()
        let messagesViewBuilder = MessagesViewBuilder.make()
        let settingsViewBuilder = SettingsViewBuilder.make()
        self.setViewControllers([homeViewModel, messagesViewBuilder, settingsViewBuilder], animated: true)

        tabBarView = TabBarView()
        view.addSubview(tabBarView)
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarView.heightAnchor.constraint(equalToConstant: 40),
            tabBarView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        tabBarView.delegate = self
        delegate = self
    }
}

extension TabBarController: TabBarViewDelegate {
    func selectedIndexChanged(index: Int) {
        selectedIndex = index
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabBarTransition(viewControllers: tabBarController.viewControllers)
    }
}

