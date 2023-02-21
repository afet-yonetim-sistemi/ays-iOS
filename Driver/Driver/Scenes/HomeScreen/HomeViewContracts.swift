//
//  HomeViewContracts.swift
//  Driver
//
//  Created by Fatih Doğan on 21.02.2023.
//

import Foundation

///  View Delegate
protocol HomeViewDelegate: AnyObject {
    func handleOutput(_ output: HomeViewModelOutput)
}

///  View Model Protocol
protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewDelegate? { get set }
}

/// View Model Output
enum HomeViewModelOutput { }

/// Router Protocol
protocol HomeViewRouterProtocol: AnyObject {
    func routeToPage(_ routes: HomeViewRoutes)
   }

enum HomeViewRoutes { }
