//
//  SplashScreenViewController.swift
//  YonetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit.UIViewController
/**
Splash Screen View Controller
*/
final class SplashScreenViewController: BaseViewController {
    
    // MARK: Properties
    var viewModel: SplashScreenViewModelProtocol!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getSomeData()
    }
}
extension SplashScreenViewController: SplashScreenViewDelegate {
    
    ///  Handle output return from view model
    /// - Parameter output: Splash Screen View Model Output
    func handleOutput(_ output: SplashScreenViewModelOutput) {
        switch output {
        case .returnData(let someData):
            if let data = someData as? String {
                viewModel.nextPage()
            }
        }
    }
}
