//
//  LoginViewModel.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import Foundation

final class LoginViewModel: LoginViewModelProtocol {
    // MARK: -Properties
    weak var delegate: LoginViewDelegate?
    var router: LoginRouterProtocol!
    /**
     View controller sends user name and password to login app
     ## Important Notes ##
     - parameters:
     - userName: String
     - password: String
    */
    func login(userName: String?, password: String?) {
        if let userName, let password, !userName.isEmpty, !password.isEmpty {
        #warning("Fatih: We can change login criteria,when the web service is defined.")
            delegate?.handleOutput(.setSpinner(isLoading: true))
            // FIXME: After service create, login method will be added here
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                guard let self else { return }
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
