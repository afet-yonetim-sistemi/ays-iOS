//
//  SplashScreenViewModel.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

final class SplashScreenViewModel: SplashScreenVMProtocol{
    weak var delegate: SplashScreenViewDelegate?
    var router: SplashScreenRouterProtocol!
    
    func getSomeData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
            self.delegate?.handleOutput(.returnData(someData: "Done"))
        }
    }
    func nextPage() {
        router.routeToPage(.nextPage)
    }
}
