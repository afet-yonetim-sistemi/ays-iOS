//
//  LoginViewModel.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import Foundation

final class LoginViewModel: LoginViewModelProtocol{
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
        delegate?.handleOutput(.setSpinner(isLoading: true))
        if let userName, let password, !userName.isEmpty, !password.isEmpty {
            apiManager.login(username: userName, password: password, success: { [weak self] in
                guard let self else { return }
                if let token = TokenManager.getAccessToken()?.token {
                    let jwtDecodedDict = TokenDataManager.decode(jwtToken: token)
                    Session.saveSessionData(dict: jwtDecodedDict)
                }
                self.delegate?.handleOutput(.setSpinner(isLoading: false))
                self.delegate?.handleOutput(.loginSuccesfully)
            }, fail: { [weak self] error  in
                guard let self else { return }
                self.delegate?.handleOutput(.setSpinner(isLoading: false))
                guard let error = error as? APIError else { return }
                self.delegate?.handleOutput(.error(errorDescription: error.message))
            })
        } else {
            delegate?.handleOutput(.setSpinner(isLoading: false))
            delegate?.handleOutput(.error(errorDescription: LocalError.emptyTextField.errorDescription))
        }
    }
    
    func navigateHomeView() {
        router.routeToPage(.homeView)
    }
}
