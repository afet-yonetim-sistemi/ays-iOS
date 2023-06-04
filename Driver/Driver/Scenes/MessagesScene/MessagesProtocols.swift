//
//  MessagesProtocols.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//


import UIKit.UIViewController

//MARK: - View Delegate
protocol MessagesViewDelegate: AnyObject {
    
}

//MARK: - View Model Protocol
protocol MessagesViewModelProtocol: AnyObject {
    var delegate: MessagesViewDelegate? { get set }
}

//MARK: - View Model Output
enum MessagesViewModelOutput { }

//MARK: - Router Protocol
protocol MessagesViewRouterProtocol: AnyObject {}

enum MessagesViewRoutes { }
