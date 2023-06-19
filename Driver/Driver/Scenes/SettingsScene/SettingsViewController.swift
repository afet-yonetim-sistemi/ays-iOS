//
//  SettingsViewController.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//

import UIKit.UIViewController

final class SettingsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var loadLabel: UILabel!
    @IBOutlet weak var initialAddressLabel: UILabel!
    @IBOutlet weak var finalAddressLabel: UILabel!
    
    @IBOutlet weak var feedbackButton: UIButton!
    @IBOutlet weak var deleteAccountButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: Properties
    var viewModel: SettingsViewModelProtocol!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
}
