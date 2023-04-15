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
    func getSomeData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
            guard let self else { return }
            self.delegate?.handleOutput(.returnData(someData: "Done"))
        }
    }
    func nextPage() {
        router.routeToPage(.nextPage)
    }
}
