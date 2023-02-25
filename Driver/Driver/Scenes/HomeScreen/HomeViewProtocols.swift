//
//  HomeViewProtocols.swift
//  Driver
//
//  Created by Fatih Doğan on 21.02.2023.
//

import Foundation

//MARK: - View Delegate
protocol HomeViewDelegate: AnyObject {
    func handleOutput(_ output: HomeViewModelOutput)
}

//MARK: - View Model Protocol
protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewDelegate? { get set }
}

//MARK: - View Model Output
enum HomeViewModelOutput { }

//MARK: - Router Protocol
protocol HomeViewRouterProtocol: AnyObject {
    func routeToPage(_ routes: HomeViewRoutes)
   }

enum HomeViewRoutes { }
