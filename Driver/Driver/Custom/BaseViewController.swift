//
//  BaseViewController.swift
//  Driver
//
//  Created by Fatih Doğan on 23.02.2023.
//

import UIKit.UIViewController

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load:", Self.identifier)
    }
    deinit {
        print("View deinit:", Self.identifier)
    }
    func showAlert(alertType: AlertType , for description: String, actionName: String, action: ((UIAlertAction) -> Void)? = nil) {
        let alertView = UIAlertController(title: alertType.rawValue, message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: actionName, style: action == nil ? .cancel : .default , handler: action)
        alertView.addAction(action)
        present(alertView, animated: true)
    }
}

