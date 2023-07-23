//
//  SplashScreenViewModel.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

final class SplashScreenViewModel: SplashScreenViewModelProtocol {
    
    // MARK: Propeties
    weak var delegate: SplashScreenViewDelegate?
    var router: SplashScreenRouterProtocol!
    
    // MARK: Functions
    func getToken() {
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            /// Check token in userdefaults
            if TokenManager.haveAuthTokens() {
                /// Token was saved before
                if TokenManager.haveValidAutTokens() {
                    self.getUserInfo()
                    /// Access token is valid
                    self.router.routeToPage(.mapScreen)
                } else {
                    /// Access token is invalid
                    /// App must get new access token via refresh token
                    apiManager.refreshToken { [weak self] in
                        guard let self else { return }
                        self.getUserInfo()
                        self.router.routeToPage(.mapScreen)
                    } fail: { _ in
                        self.router.routeToPage(.loginPage)
                    }
                }
            } else {
                /// Token wasn't saved before
                self.router.routeToPage(.loginPage)
            }
        }
    }
    
    private func getUserInfo() {
        if let token = TokenManager.getAccessToken()?.token {
            let jwtDecodedDict = TokenDataManager.decode(jwtToken: token)
            Session.saveSessionData(dict: jwtDecodedDict)
        }
    }
}
