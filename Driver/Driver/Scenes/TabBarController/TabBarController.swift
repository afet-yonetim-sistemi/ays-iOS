//
//  TabBarController.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//

import UIKit.UIViewController

final class TabBarController: UITabBarController {
    private var tabBarView : UIView!
    
    override func viewDidLoad() {
        selectedIndex = 0
        
        let homeViewModel = HomeViewBuilder.make()
        let messagesViewBuilder = MessagesViewBuilder.make()
        let settingsViewBuilder = SettingsViewBuilder.make()
        
        self.setViewControllers([homeViewModel, messagesViewBuilder, settingsViewBuilder], animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        tabBarView = Bundle.main.loadNibNamed("TabBarView", owner: nil, options: nil)?.last as! UIView
        tabBarView.frame = CGRect(x: 0.0, y: self.view.frame.size.height - tabBarView.frame.size.height - (UIWindow.key?.safeAreaInsets.bottom ?? 0) , width: tabBarView.frame.size.width, height: tabBarView.frame.size.height)
        if let tabbar = tabBarView as? TabBarView {
            tabbar.delegate = self
        }
           self.view.addSubview(tabBarView)
    }
}

extension TabBarController: TabBarViewDelegate {
    func selectedIndexChanged(index: Int) {
        print(index)
        selectedIndex = index
    }
}
extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
