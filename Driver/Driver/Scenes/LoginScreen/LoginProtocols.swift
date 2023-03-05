//
//  LoginProtocols.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import Foundation

//MARK: - View Delegate
protocol LoginViewDelegate: AnyObject {
    func handleOutput(_ output: LoginViewModelOutput)
}

//MARK: - View Model Protocol
protocol LoginViewModelProtocol: AnyObject {
    var delegate: LoginViewDelegate? { get set }

    func login(userName: String?, password: String?)
    func navigateHomeView()
}

//MARK: - View Model Output
enum LoginViewModelOutput {
    case error(errorDescription: String)
    case setSpinner(isLoading: Bool)
    case loginSuccesfully
}

//MARK: - Router Protocol
protocol LoginRouterProtocol: AnyObject {
    func routeToPage(_ routes: LoginRoutes)
   }

enum LoginRoutes {
       case homeView
   }
