//
//  HomeViewController.swift
//  YonetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit.UIViewController

final class HomeViewController: BaseViewController {
    // MARK: Outlets
    @IBOutlet private weak var statusButton: CustomReusableButtonView!
    @IBOutlet private weak var maydayButton: CustomReusableButtonView!
    @IBOutlet private weak var roadStatusButton: CustomReusableButtonView!
    
    // MARK: Properties
    var viewModel: HomeViewModelProtocol!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
    }
    
    private func setButtons() {
        statusButton.configureButton(title: "Statü", imageName: "status") {[weak self] in
            self?.viewModel.buttonPressed(type: .status)
        }
        maydayButton.configureButton(title: "Yardım Çağır", imageName: "help") {[weak self] in
            self?.viewModel.buttonPressed(type: .help)
        }
        roadStatusButton.configureButton(title: "Tehlikeli Yol", imageName: "road") {[weak self] in
            self?.viewModel.buttonPressed(type: .roadStatus)
        }
    }
}
extension HomeViewController: HomeViewDelegate {
    func handleOutput(_ output: HomeViewModelOutput) { }
}
