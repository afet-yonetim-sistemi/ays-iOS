//
//  UIViewController.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit

extension UIViewController: Reusable { }

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: T.identifier, bundle: nil)
        }
        
        return instantiateFromNib()
    }
}
