//
//  MessagesViewModel.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//  
//

import UIKit.UIViewController

final class MessagesViewModel {
    
    // MARK: Propeties
    weak var delegate: MessagesViewDelegate?
    var router: MessagesViewRouterProtocol!
}
//MARK: - MessagesViewModelProtocol
extension MessagesViewModel: MessagesViewModelProtocol {
    
}
