//
//  SplashScreenProtocols.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

///  View Delegate
protocol SplashScreenViewDelegate: AnyObject {
    func handleOutput(_ output: SplashScreenViewModelOutput)
}

///  View Model Protocol
protocol SplashScreenViewModelProtocol: AnyObject {
    var delegate: SplashScreenViewDelegate? { get set }
    func getSomeData()
    func nextPage()
}

/// View Model Output
enum SplashScreenViewModelOutput {
    case returnData(someData: Any)
}

/// Router Protocol
protocol SplashScreenRouterProtocol: AnyObject {
    func routeToPage(_ routes: SplashScreenRoutes)
   }

enum SplashScreenRoutes {
       case nextPage
   }
