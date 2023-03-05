//
//  HomeViewController.swift
//  YonetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit.UIViewController

final class HomeViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var settingsButton: CustomReusableButtonView!
    @IBOutlet private weak var roadStatusButton: CustomReusableButtonView!
    @IBOutlet private weak var maydayButton: CustomReusableButtonView!
    @IBOutlet private weak var statusButton: CustomReusableButtonView!
    
    // MARK: Properties
    var viewModel: HomeViewModelProtocol!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
    }
    
    private func setButtons() {
        settingsButton.configureButton(title: "Ayarlar", imageName: "gear") { [weak self] in
            self?.viewModel.buttonPressed(type: .settings)
        }
        roadStatusButton.configureButton(title: "Yol Durumu", imageName: "road") {[weak self] in
            self?.viewModel.buttonPressed(type: .roadStatus)
        }
        maydayButton.configureButton(title: "Yardım Çağır", imageName: "help") {[weak self] in
            self?.viewModel.buttonPressed(type: .help)
        }
        statusButton.configureButton(title: "Durum", imageName: "status") {[weak self] in
            self?.viewModel.buttonPressed(type: .status)
        }
    }
}
extension HomeViewController: HomeViewDelegate {
    func handleOutput(_ output: HomeViewModelOutput) { }
}
