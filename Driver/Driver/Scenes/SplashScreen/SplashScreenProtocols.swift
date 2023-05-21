//
//  SplashScreenProtocols.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

//MARK: - View Delegate
protocol SplashScreenViewDelegate: AnyObject {
    func handleOutput(_ output: SplashScreenViewModelOutput)
}

//MARK: - View Model Protocol
protocol SplashScreenViewModelProtocol: AnyObject {
    var delegate: SplashScreenViewDelegate? { get set }
    func getToken()
}

//MARK: - View Model Output
enum SplashScreenViewModelOutput {
//    case returnData(someData: Any)
}

//MARK: - Router Protocol
protocol SplashScreenRouterProtocol: AnyObject {
    func routeToPage(_ routes: SplashScreenRoutes)
   }

enum SplashScreenRoutes {
    case mapScreen
    case loginPage
   }
