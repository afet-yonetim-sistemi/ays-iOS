//
//  SettingsViewController.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//

import UIKit.UIViewController

final class SettingsViewController: UIViewController {
    
    // MARK: Properties
    var viewModel: SettingsViewModelProtocol!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: - SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
}
