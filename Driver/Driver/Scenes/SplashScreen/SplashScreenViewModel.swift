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
        
        DispatchQueue.main.async {
            /// Check token in userdefaults
            if TokenManager.haveAuthTokens() {
                /// Token was saved before
            
                if TokenManager.haveValidAutTokens() {
                    /// Access token is valid
                    self.router.routeToPage(.mapScreen)
                } else {
                    /// Access token is invalid
                    /// App must get new access token via refresh token
                    apiManager.refreshToken {
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
}
