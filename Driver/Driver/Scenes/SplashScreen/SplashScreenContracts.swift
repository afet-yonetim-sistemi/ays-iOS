//
//  SplashScreenContracts.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

///  View Delegate
protocol SplashScreenViewDelegate: AnyObject {
    func handleOutput(_ output: SplashScreenVMOutput)
}

///  View Model Protocol
protocol SplashScreenVMProtocol: AnyObject {
    var delegate: SplashScreenViewDelegate? { get set }
    func getSomeData()
    func nextPage()
}


/// View Model Output
enum SplashScreenVMOutput{
    case returnData(someData: Any)
}


/// Router Protocol
protocol SplashScreenRouterProtocol: AnyObject {
    func routeToPage(_ routes: TradeRoutes)
   }

   enum TradeRoutes {
       case nextPage
   }
