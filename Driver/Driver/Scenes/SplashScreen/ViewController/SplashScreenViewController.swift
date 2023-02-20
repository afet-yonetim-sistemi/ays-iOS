//
//  SplashScreenViewController.swift
//  YonetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import UIKit
/**
Splash Screen View Controller
*/
class SplashScreenViewController: UIViewController {
    var viewModel: SplashScreenVMProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getSomeData()
    }
    
}
extension SplashScreenViewController: SplashScreenViewDelegate {
    
    ///  Handle output return from view model
    /// - Parameter output: Splash Screen View Model Output
    func handleOutput(_ output: SplashScreenVMOutput) {
        switch output {
        case .returnData(let someData):
            if let data = someData as? String {
                print(data)
                viewModel.nextPage()
            }
        }
    }
    
    
}
