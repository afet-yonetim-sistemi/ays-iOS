//
//  FirstViewController.swift
//  YonetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    static func show(from:UIViewController) {
        let firstViewController = FirstViewController.loadFromNib()
        firstViewController.modalTransitionStyle = .crossDissolve
        firstViewController.modalPresentationStyle = .fullScreen
        from.present(firstViewController, animated: true)
    }
}
