//
//  LoginViewContracts.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import Foundation

///  View Delegate
protocol LoginViewDelegate: AnyObject {
    func handleOutput(_ output: LoginViewModelOutput)
}

///  View Model Protocol
protocol LoginViewModelProtocol: AnyObject {
    var delegate: LoginViewDelegate? { get set }

    ///   Login method, arguments will be checked whether empty or not
    /// - Parameters:
    ///   - userName: String
    ///   - password: String and minimum 4 char
    func login(userName: String?, password: String?)
    
    /// After login succesfully this method navigate to home view
    func navigateHomeView()
}

/// View Model Output
enum LoginViewModelOutput {
    case error(errorDescription: String)
    case setSpinner(isLoading: Bool)
    case loginSuccesfully
}

/// Router Protocol
protocol LoginRouterProtocol: AnyObject {
    func routeToPage(_ routes: LoginRoutes)
   }

enum LoginRoutes {
       case homeView
   }
