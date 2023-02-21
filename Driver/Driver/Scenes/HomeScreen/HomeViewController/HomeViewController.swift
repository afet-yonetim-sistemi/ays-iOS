//
//  HomeViewController.swift
//  YonetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit.UIViewController

final class HomeViewController: UIViewController {
    
    // MARK: Properties
    var viewModel: HomeViewModelProtocol!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension HomeViewController: HomeViewDelegate {
    func handleOutput(_ output: HomeViewModelOutput) { }
}
