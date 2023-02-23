//
//  LoginViewModel.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import Foundation

final class LoginViewModel: LoginViewModelProtocol {
    weak var delegate: LoginViewDelegate?
    var router: LoginRouterProtocol!
    
    func login(userName: String?, password: String?) {
        if let userName, let password, !userName.isEmpty, !password.isEmpty {
            delegate?.handleOutput(.setSpinner(isLoading: true))
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.delegate?.handleOutput(.setSpinner(isLoading: false))
                self.delegate?.handleOutput(.loginSuccesfully)
            }
        } else {
            delegate?.handleOutput(.setSpinner(isLoading: false))
            delegate?.handleOutput(.error(errorDescription: LocalError.emptyTextField.errorDescription))
        }
    }
    
    func navigateHomeView() {
        router.routeToPage(.homeView)
    }
}
