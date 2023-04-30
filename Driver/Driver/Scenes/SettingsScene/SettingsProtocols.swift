//
//  SettingsProtocols.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//


import UIKit.UIViewController

//MARK: - View Delegate
protocol SettingsViewDelegate: AnyObject {
    
}

//MARK: - View Model Protocol
protocol SettingsViewModelProtocol: AnyObject {
    var delegate: SettingsViewDelegate? { get set }
}

//MARK: - View Model Output
enum SettingsViewModelOutput { }

//MARK: - Router Protocol
protocol SettingsViewRouterProtocol: AnyObject {}

enum SettingsViewRoutes { }
